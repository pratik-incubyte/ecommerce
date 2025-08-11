/// Base class for all exceptions in the application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  
  const AppException(this.message, {this.code});
  
  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Server exceptions
class ServerException extends AppException {
  const ServerException(String message, {String? code}) 
      : super(message, code: code);
}

/// Cache exceptions
class CacheException extends AppException {
  const CacheException(String message, {String? code}) 
      : super(message, code: code);
}

/// Network exceptions
class NetworkException extends AppException {
  const NetworkException(String message, {String? code}) 
      : super(message, code: code);
}

/// Authentication exceptions
class AuthException extends AppException {
  const AuthException(String message, {String? code}) 
      : super(message, code: code);
}

/// Database exceptions
class DatabaseException extends AppException {
  const DatabaseException(String message, {String? code}) 
      : super(message, code: code);
}

/// Validation exceptions
class ValidationException extends AppException {
  const ValidationException(String message, {String? code}) 
      : super(message, code: code);
}
