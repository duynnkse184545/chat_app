/// Base exception class for all app-specific exceptions.
class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

/// Thrown when there's a server/backend error.
class ServerException extends AppException {
  ServerException(super.message);
}

/// Thrown when there's an authentication/authorization error.
class AuthException extends AppException {
  AuthException(super.message);
}

/// Thrown when there's a local storage/cache error.
class CacheException extends AppException {
  CacheException(super.message);
}

/// Thrown when there's a network connectivity error.
class NetworkException extends AppException {
  NetworkException(super.message);
}

/// Thrown when a requested resource is not found.
class NotFoundException extends AppException {
  NotFoundException(super.message);
}

/// Thrown when user doesn't have permission to access a resource.
class PermissionException extends AppException {
  PermissionException(super.message);
}

/// Thrown when data validation fails.
class ValidationException extends AppException {
  ValidationException(super.message);
}

/// Thrown when an operation times out.
class TimeoutException extends AppException {
  TimeoutException(super.message);
}

/// Thrown when storage quota is exceeded.
class StorageException extends AppException {
  StorageException(super.message);
}