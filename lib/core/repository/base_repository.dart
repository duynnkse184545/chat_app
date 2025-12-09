import 'package:dartz/dartz.dart';

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
      return Left(Failure.authFailure(e.message));
    } on NetworkException catch (e) {
      return Left(Failure.networkFailure(e.message));
    } on CacheException catch (e) {
      return Left(Failure.cacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(Failure.serverFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(Failure.notFoundFailure(e.message));
    } on PermissionException catch (e) {
      return Left(Failure.permissionFailure(e.message));
    } catch (e) {
      return Left(Failure.unknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> executeVoid(
      Future<void> Function() operation,
      ) async {
    return execute(operation);
  }

}