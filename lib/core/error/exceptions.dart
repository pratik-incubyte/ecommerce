class ServerException implements Exception {
  final String? message;
  final String? code;

  ServerException({this.message, this.code});
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

class NetworkException implements Exception {
  final String? message;

  NetworkException({this.message});
}

class DatabaseException implements Exception {
  final String? message;

  DatabaseException({this.message});
}

class AuthException implements Exception {
  final String? message;
  final String? code;

  AuthException({this.message, this.code});
}

class FirebaseException implements Exception {
  final String? message;
  final String? code;

  FirebaseException({this.message, this.code});
}

class ValidationException implements Exception {
  final String message;
  final Map<String, List<String>>? errors;

  ValidationException({
    required this.message,
    this.errors,
  });
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException({this.message});
}