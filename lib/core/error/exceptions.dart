class AppException implements Exception{
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class ServerException extends AppException{
  ServerException(super.message);
}

class AuthException extends AppException{
  AuthException(super.message);
}

class CacheException extends AppException{
  CacheException(super.message);
}

class NetworkException extends AppException{
  NetworkException(super.message);
}

class NotFoundException extends AppException {
  NotFoundException(super.message);
}

class PermissionException extends AppException {
  PermissionException(super.message);
}