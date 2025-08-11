import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Custom Dio client with interceptors for the application
class DioClient {
  late Dio _dio;
  final Logger _logger = Logger();
  
  DioClient({String? baseUrl}) {
    _dio = Dio();
    
    // Base options
    _dio.options = BaseOptions(
      baseUrl: baseUrl ?? 'https://api.example.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    // Add interceptors
    _dio.interceptors.addAll([
      _LoggingInterceptor(_logger),
      _ErrorInterceptor(),
      _AuthInterceptor(),
    ]);
  }
  
  Dio get dio => _dio;
  
  /// Set authorization token
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  /// Clear authorization token
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}

/// Logging interceptor for API requests and responses
class _LoggingInterceptor extends Interceptor {
  final Logger _logger;
  
  _LoggingInterceptor(this._logger);
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    _logger.d('Headers: ${options.headers}');
    _logger.d('Data: ${options.data}');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    _logger.d('Data: ${response.data}');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    _logger.e('Message: ${err.message}');
    _logger.e('Data: ${err.response?.data}');
    super.onError(err, handler);
  }
}

/// Error interceptor for handling common HTTP errors
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message;
    
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.badResponse:
        message = _handleStatusError(err.response?.statusCode ?? 0);
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;
      default:
        message = 'Something went wrong. Please try again.';
    }
    
    err = err.copyWith(message: message);
    super.onError(err, handler);
  }
  
  String _handleStatusError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access forbidden.';
      case 404:
        return 'Resource not found.';
      case 422:
        return 'Validation error. Please check your input.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 502:
        return 'Bad gateway. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}

/// Auth interceptor for handling authentication
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add any additional auth logic here if needed
    super.onRequest(options, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle token refresh or redirect to login
      // This can be implemented based on your auth strategy
    }
    super.onError(err, handler);
  }
}
