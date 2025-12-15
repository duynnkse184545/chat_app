import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

abstract class BaseRepository{
  Future<Either<Failure, T>> execute<T>(
      Future<T> Function() operation,
      ) async {
    try {
      // Execute the operation
      final result = await operation();
      return Right(result);
    } on AuthException catch (e) {
      debugPrint('🔐 AuthException: ${e.message}');
      return Left(Failure.authFailure(e.message));
    } on NetworkException catch (e) {
      debugPrint('🌐 NetworkException: ${e.message}');
      return Left(Failure.networkFailure(e.message));
    } on CacheException catch (e) {
      debugPrint('💾 CacheException: ${e.message}');
      return Left(Failure.cacheFailure(e.message));
    } on ServerException catch (e) {
      debugPrint('🖥️ ServerException: ${e.message}');
      return Left(Failure.serverFailure(e.message));
    } on NotFoundException catch (e) {
      debugPrint('🔍 NotFoundException: ${e.message}');
      return Left(Failure.notFoundFailure(e.message));
    } on PermissionException catch (e) {
      debugPrint('🚫 PermissionException: ${e.message}');
      return Left(Failure.permissionFailure(e.message));
    } catch (e, stackTrace) {
      debugPrint('❌ UnknownException: $e');
      debugPrint('📍 StackTrace: $stackTrace');
      return Left(Failure.unknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> executeVoid(
      Future<void> Function() operation,
      ) async {
    return execute(operation);
  }

}