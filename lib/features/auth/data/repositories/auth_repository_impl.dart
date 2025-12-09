import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
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
        } catch (_) {}
        return userModel.toEntity();
      } else {
        try {
          await localDatasource.clearCache();
        } catch (_) {}
        return null;
      }
    });
  }

  @override
  FutureEither<UserEntity?> getCurrentUser() async {
    try {
      final cachedUser = await localDatasource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }

      final userModel = await remoteDatasource.getCurrentUser();
      if (userModel == null) {
        return const Right(null);
      }

      await localDatasource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.authFailure(e.message));
    } on CacheException {
      try {
        final userModel = await remoteDatasource.getCurrentUser();

        if (userModel == null) {
          return const Right(null);
        }

        try {
          await localDatasource.cacheUser(userModel);
        } catch (_) {

        }
        return Right(userModel.toEntity());
      } on AuthException catch (e) {
        return Left(Failure.authFailure(e.message));
      } on NetworkException catch (e) {
        return Left(Failure.networkFailure(e.message));
      } catch (e) {
        return Left(Failure.unknownFailure(e.toString()));
      }
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  FutureEither<UserEntity> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userModel = await remoteDatasource.signInWithEmailAndPassword(
          email: email, password: password);

      await localDatasource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.authFailure(e.message));
    } on NetworkException catch (e) {
      try {
        final cachedUser = await localDatasource.getCachedUser();
        if(cachedUser != null && cachedUser.email == email) {
          return Right(cachedUser.toEntity());
        }
      } catch(_) {

      }
      return Left(Failure.networkFailure(e.message));
    } on CacheException catch (e) {
      return Left(Failure.cacheFailure(e.message));
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  FutureVoid signOut() async {
    try {
      await remoteDatasource.signOut();
      await localDatasource.clearCache();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure.authFailure(e.message));
    } on CacheException {
      return const Right(null);
    }catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  FutureEither<UserEntity> signUpWithEmailAndPassword(
      {required String email, required String password, required String username}) async {
    try {
      final userModel = await remoteDatasource.signUpWithEmailAndPassword(
          email: email, password: password, username: username);

      await localDatasource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.authFailure(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.networkFailure(e.message));
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  @override
  FutureEither<UserEntity> updateProfile({required String uid, String? username, String? avatarUrl, String? bio}) async {
    try {
      final userModel = await remoteDatasource.updateProfile(uid: uid, username: username, avatarUrl: avatarUrl, bio: bio);

      await localDatasource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.authFailure(e.message));
    } on CacheException catch (e) {
      return Left(Failure.cacheFailure(e.message));
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }
}