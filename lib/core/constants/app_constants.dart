/// Application-wide constants
class AppConstants {
  static const String appName = 'E-Commerce App';
  static const String appVersion = '1.0.0';
  
  // API endpoints
  static const String baseUrl = 'https://api.ecommerce.com';
  static const String apiVersion = 'v1';
  
  // Storage keys
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String isLoggedInKey = 'is_logged_in';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  
  // Network timeouts
  static const int connectTimeoutMs = 30000;
  static const int receiveTimeoutMs = 30000;
  static const int sendTimeoutMs = 30000;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Cache durations (in minutes)
  static const int shortCacheDuration = 5;
  static const int mediumCacheDuration = 30;
  static const int longCacheDuration = 1440; // 24 hours
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 8.0;
  
  // Animation durations
  static const int shortAnimationMs = 200;
  static const int mediumAnimationMs = 300;
  static const int longAnimationMs = 500;
}

/// API endpoint paths
class ApiPaths {
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  
  // User endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/update';
  static const String uploadAvatar = '/user/avatar';
  
  // Product endpoints
  static const String products = '/products';
  static const String productCategories = '/products/categories';
  static const String featuredProducts = '/products/featured';
  static const String searchProducts = '/products/search';
  
  // Cart endpoints
  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static const String updateCart = '/cart/update';
  static const String removeFromCart = '/cart/remove';
  static const String clearCart = '/cart/clear';
  
  // Order endpoints
  static const String orders = '/orders';
  static const String createOrder = '/orders/create';
  static const String orderDetails = '/orders';
  static const String cancelOrder = '/orders/cancel';
}

/// Error messages
class ErrorMessages {
  static const String networkError = 'Please check your internet connection';
  static const String serverError = 'Something went wrong. Please try again later';
  static const String unknownError = 'An unexpected error occurred';
  static const String timeoutError = 'Request timeout. Please try again';
  static const String validationError = 'Please check your input';
  static const String authError = 'Authentication failed';
  static const String notFoundError = 'Resource not found';
  static const String permissionError = 'You don\'t have permission to perform this action';
}

/// Success messages
class SuccessMessages {
  static const String loginSuccess = 'Login successful';
  static const String registerSuccess = 'Registration successful';
  static const String profileUpdated = 'Profile updated successfully';
  static const String productAddedToCart = 'Product added to cart';
  static const String orderPlaced = 'Order placed successfully';
  static const String passwordReset = 'Password reset successfully';
}
