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
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRemoteDatasourceImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseAuth = firebaseAuth,
       _firebaseFirestore = firebaseFirestore;

  @override
  Stream<UserModel?> authStateChanges() {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      try {
        final userDoc = await _firebaseFirestore
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
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) return null;

      final userDoc = await _firebaseFirestore
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
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if (userCredential.user == null) {
        throw AuthException('Failed to sign in!');
      }

      final userDoc = await _firebaseFirestore.collection(
          FirebaseConstants.usersCollection)
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        throw AuthException('User not found!');
      }
      return UserModel.fromJson(userDoc.data()!);
    } on FirebaseAuthException catch (_) {
      // Let FirebaseAuthException bubble up to repository for proper conversion
      rethrow;
    } catch (e) {
      // Only convert non-Firebase exceptions
      if (e is AuthException) rethrow;
      throw AuthException('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
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
      // Create Firebase Auth user first
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if (userCredential.user == null) {
        throw AuthException('Failed to create user!');
      }

      // Now user is authenticated, we can check username
      final userQuery = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .where('username', isEqualTo: username)
          .limit(1)
          .get();
      
      if (userQuery.docs.isNotEmpty) {
        // Username taken - delete the auth user we just created
        await userCredential.user!.delete();
        throw AuthException('Username is already taken!');
      }

      // Create user document
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        username: username,
        createdAt: DateTime.now(),
      );

      await _firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .doc(userModel.uid)
          .set(userModel.toJson());

      return userModel;
    } on FirebaseAuthException catch (_) {
      // Let FirebaseAuthException bubble up to repository for proper conversion
      rethrow;
    } catch(e) {
      // Only convert non-Firebase exceptions
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

      await _firebaseFirestore.collection(FirebaseConstants.usersCollection)
      .doc(uid)
      .update(updates);

      final userDoc = await _firebaseFirestore.collection(FirebaseConstants.usersCollection)
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

}
