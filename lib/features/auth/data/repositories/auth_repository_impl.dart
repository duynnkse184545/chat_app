import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/error_handler.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart' show FirebaseException;
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  /// Converts Firebase Auth exceptions to user-friendly failures.
  Failure _convertAuthException(FirebaseAuthException e) {
    debugPrint('🔴 Firebase Auth Error: ${e.code} - ${e.message}');
    
    return switch (e.code) {
      'user-not-found' => const Failure.authFailure('No account found with this email.'),
      'wrong-password' => const Failure.authFailure('Incorrect password. Please try again.'),
      'email-already-in-use' => const Failure.authFailure('An account already exists with this email.'),
      'invalid-email' => const Failure.authFailure('Invalid email address.'),
      'weak-password' => const Failure.authFailure('Password is too weak. Use at least 6 characters.'),
      'user-disabled' => const Failure.authFailure('This account has been disabled.'),
      'too-many-requests' => const Failure.authFailure('Too many attempts. Please try again later.'),
      'operation-not-allowed' => const Failure.authFailure('This operation is not allowed.'),
      'network-request-failed' => const Failure.networkFailure('Network error. Please check your connection.'),
      _ => Failure.authFailure(e.message ?? 'Authentication failed. Please try again.'),
    };
  }

  /// Converts Firebase exceptions to failures.
  Failure _convertFirebaseException(FirebaseException e) {
    debugPrint('🔴 Firebase Error: ${e.code} - ${e.message}');
    
    return switch (e.code) {
      'permission-denied' => const Failure.permissionFailure('You do not have permission to access this resource.'),
      'not-found' => const Failure.notFoundFailure('Requested resource not found.'),
      'already-exists' => const Failure.serverFailure('Resource already exists.'),
      'unavailable' => const Failure.serverFailure('Service temporarily unavailable. Please try again.'),
      _ => Failure.serverFailure(e.message ?? 'Server error occurred.'),
    };
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return remoteDatasource.authStateChanges().asyncMap((userModel) async {
      if (userModel != null) {
        try {
          await localDatasource.cacheUser(userModel);
          return userModel.toEntity();
        } catch (e) {
          debugPrint('⚠️ Failed to cache user on auth state change: $e');
        }
        return userModel.toEntity();
      } else {
        try {
          await localDatasource.clearCache();
        } catch (e) {
          debugPrint('⚠️ Failed to clear cache on sign out: $e');
        }
        return null;
      }
    });
  }

  @override
  FutureEither<UserEntity?> getCurrentUser() async {
    try {
      // Try to get cached user first, but don't fail if cache read fails
      try {
        final cachedUser = await localDatasource.getCachedUser();
        if (cachedUser != null) {
          return Right(cachedUser.toEntity());
        }
      } catch (e) {
        debugPrint('⚠️ Failed to read cached user, fetching from remote: $e');
      }

      final userModel = await remoteDatasource.getCurrentUser();
      if (userModel == null) return const Right(null);

      // Cache the user but don't fail if caching fails
      await ErrorHandler.handleSafely(
        () => localDatasource.cacheUser(userModel),
        'Cache user on getCurrentUser',
      );

      return Right(userModel.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(_convertAuthException(e));
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDatasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Cache user but don't fail sign-in if caching fails
      await ErrorHandler.handleSafely(
        () => localDatasource.cacheUser(userModel),
        'Cache user on sign-in',
      );

      return Right(userModel.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(_convertAuthException(e));
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid signOut() async {
    try {
      await remoteDatasource.signOut();

      // Try to clear cache but don't fail sign-out if it fails
      await ErrorHandler.handleSafely(
        () => localDatasource.clearCache(),
        'Clear cache on sign-out',
      );

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(_convertAuthException(e));
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userModel = await remoteDatasource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );

      // Cache user but don't fail sign-up if caching fails
      await ErrorHandler.handleSafely(
        () => localDatasource.cacheUser(userModel),
        'Cache user on sign-up',
      );

      return Right(userModel.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(_convertAuthException(e));
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<UserEntity> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
  }) async {
    try {
      final userModel = await remoteDatasource.updateProfile(
        uid: uid,
        username: username,
        avatarUrl: avatarUrl,
        bio: bio,
      );

      // Cache user but don't fail update if caching fails
      await ErrorHandler.handleSafely(
        () => localDatasource.cacheUser(userModel),
        'Cache user on profile update',
      );

      return Right(userModel.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(_convertAuthException(e));
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}
