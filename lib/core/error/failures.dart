import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure{
  const factory Failure.serverFailure(String message) = ServerFailure;
  const factory Failure.authFailure(String message) = AuthFailure;
  const factory Failure.cacheFailure(String message) = CacheFailure;
  const factory Failure.networkFailure(String message) = NetworkFailure;
  const factory Failure.notFoundFailure(String message) = NotFoundFailure;
  const factory Failure.permissionFailure(String message) = PermissionFailure;
  const factory Failure.unknownFailure(String message) = UnknownFailure;
}

extension FailureX on Failure {
  String get message => when(
    serverFailure: (msg) => msg,
    authFailure: (msg) => msg,
    cacheFailure: (msg) => msg,
    networkFailure: (msg) => msg,
    notFoundFailure: (msg) => msg,
    permissionFailure: (msg) => msg,
    unknownFailure: (msg) => msg,
  );

  String get userFriendlyMessage => when(
    serverFailure: (msg) => 'Server error. Please try again later.',
    authFailure: (msg) => msg,
    cacheFailure: (msg) => 'Local storage error. Please clear cache.',
    networkFailure: (msg) => 'No internet connection. Please check your network.',
    notFoundFailure: (msg) => 'Resource not found.',
    permissionFailure: (msg) => 'Permission denied.',
    unknownFailure: (msg) => 'Something went wrong. Please try again.',
  );
}