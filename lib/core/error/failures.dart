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
  const factory Failure.validationFailure(String message) = ValidationFailure;
  const factory Failure.timeoutFailure(String message) = TimeoutFailure;
  const factory Failure.storageFailure(String message) = StorageFailure;
  const factory Failure.unknownFailure(String message) = UnknownFailure;
}

extension FailureX on Failure {
  /// Returns the user-friendly error message.
  /// 
  /// Repository converters provide context-specific, user-friendly messages,
  /// so this extension just extracts the message without additional conversion.
  String get message => when(
    serverFailure: (msg) => msg,
    authFailure: (msg) => msg,
    cacheFailure: (msg) => msg,
    networkFailure: (msg) => msg,
    notFoundFailure: (msg) => msg,
    permissionFailure: (msg) => msg,
    validationFailure: (msg) => msg,
    timeoutFailure: (msg) => msg,
    storageFailure: (msg) => msg,
    unknownFailure: (msg) => msg,
  );
}