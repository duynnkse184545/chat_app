import 'package:chat_app/core/repository/base_repository.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

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
    return execute(() async {
      final cachedUser = await localDatasource.getCachedUser();
      if (cachedUser != null) {
        return cachedUser.toEntity();
      }

      final userModel = await remoteDatasource.getCurrentUser();
      if (userModel == null) return null;

      await localDatasource.cacheUser(userModel);
      return userModel.toEntity();
    });
  }

  @override
  FutureEither<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return execute(() async {
      final userModel = await remoteDatasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await localDatasource.cacheUser(userModel);

      return userModel.toEntity();
    });
  }

  @override
  FutureVoid signOut() async {
    return executeVoid(() async {
      await remoteDatasource.signOut();
      await localDatasource.clearCache();
    });
  }

  @override
  FutureEither<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    return execute(() async {
      final userModel = await remoteDatasource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );

      await localDatasource.cacheUser(userModel);

      return userModel.toEntity();
    });
  }

  @override
  FutureEither<UserEntity> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
  }) async {
    return execute(() async {
      final userModel = await remoteDatasource.updateProfile(
        uid: uid,
        username: username,
        avatarUrl: avatarUrl,
        bio: bio,
      );

      await localDatasource.cacheUser(userModel);

      return userModel.toEntity();
    });
  }
}
