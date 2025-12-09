import 'package:chat_app/core/constants/firebase_constants.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();

  Stream<UserModel?> authStateChanges();

  Future<UserModel> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDatasourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Stream<UserModel?> authStateChanges() {
    return firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      try {
        final userDoc = await firebaseFirestore
            .collection(FirebaseConstants.usersCollection)
            .doc(user.uid)
            .get();

        if (!userDoc.exists) return null;

        return UserModel.fromJson(userDoc.data()!);
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) return null;

      final userDoc = await firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .doc(currentUser.uid)
          .get();

      if (!userDoc.exists) return null;

      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      throw AuthException('Failed to get current user!');
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if (userCredential.user == null) {
        throw AuthException('Failed to sign in!');
      }

      final userDoc = await firebaseFirestore.collection(
          FirebaseConstants.usersCollection)
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        throw AuthException('User not found!');
      }
      return UserModel.fromJson(userDoc.data()!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code));
    } catch (e) {
      throw AuthException('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('Failed to sign out!');
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userQuery = await firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .where('username', isEqualTo: username)
          .limit(1)
          .get();
      if (userQuery.docs.isNotEmpty) {
        throw AuthException('Username is already taken!');
      }

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if (userCredential.user == null) {
        throw AuthException('Failed to create user!');
      }

      final userModel = UserModel(uid: userCredential.user!.uid,
          email: email,
          username: username,
          createdAt: DateTime.now());

      await firebaseFirestore.collection(FirebaseConstants.usersCollection)
      .doc(userModel.uid)
      .set(userModel.toJson());

      return userModel;
    } on FirebaseException catch (e) {
      throw AuthException(_getAuthErrorMessage(e.code));
    } catch(e) {
      if(e is AuthException) rethrow;
      throw AuthException('Failed to sign up: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
  }) async {
    try {
      final Map<String, dynamic> updates = {};
      if (username != null) updates['username'] = username;
      if (avatarUrl != null) updates['avatarUrl'] = avatarUrl;
      if(bio != null) updates['bio'] = bio;

      if(updates.isEmpty) {
        throw AuthException('No fields to update!');
      }

      await firebaseFirestore.collection(FirebaseConstants.usersCollection)
      .doc(uid)
      .update(updates);

      final userDoc = await firebaseFirestore.collection(FirebaseConstants.usersCollection)
      .doc(uid)
      .get();

      if(!userDoc.exists) {
        throw AuthException('User not found!');
      }

      return UserModel.fromJson(userDoc.data()!);
    } catch(e) {
      if(e is AuthException) rethrow;
      throw AuthException('Failed to update profile!');
    }
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email is already registered';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'network-request-failed':
        throw NetworkException('Network error. Check your connection');
      default:
        return 'Authentication error: $code';
    }
  }
}
