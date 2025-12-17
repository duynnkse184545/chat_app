import 'package:dartz/dartz.dart';
import '../error/failures.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = Future<Either<Failure, void>>;
typedef StreamEither<T> = Stream<Either<Failure, T>>;