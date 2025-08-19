import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

/// Service to handle deep links and convert custom schemes to router paths
class DeepLinkService {
  static final _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;
  DeepLinkService._internal();

  final _appLinks = AppLinks();
  final _logger = Logger();
  StreamSubscription<Uri>? _linkSubscription;

  /// Initialize deep link handling
  Future<void> initialize(GoRouter router) async {
    _logger.i('🚀 Initializing DeepLinkService...');
    
    // Handle the initial link when app is opened via deep link
    try {
      _logger.i('🔍 Checking for initial deep link...');
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _logger.i('🎯 Initial deep link found: $initialLink');
        _handleDeepLink(initialLink, router);
      } else {
        _logger.i('❌ No initial deep link found');
      }
    } catch (e) {
      _logger.e('❌ Error getting initial link: $e');
    }

    // Handle incoming links when app is running
    _logger.i('👂 Setting up deep link stream listener...');
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _logger.i('📨 Incoming deep link received: $uri');
        _handleDeepLink(uri, router);
      },
      onError: (err) {
        _logger.e('❌ Deep link stream error: $err');
      },
    );
    
    _logger.i('✅ DeepLinkService initialization complete');
  }

  /// Handle deep link conversion and navigation
  void _handleDeepLink(Uri uri, GoRouter router) {
    try {
      final routerPath = _convertToRouterPath(uri);
      if (routerPath != null) {
        _logger.i('💡 Converting deep link "$uri" to router path: "$routerPath"');
        _logger.i('💡 Current location before navigation: ${router.routeInformationProvider.value.uri.path}');
        
        // Check if this is an order details deep link
        if (routerPath.startsWith('/orders/')) {
          final orderId = routerPath.split('/')[2];
          _logger.i('💡 Detected order details deep link with ID: $orderId');
          
          // Try using the named route first
          try {
            router.goNamed('order-details-deeplink', pathParameters: {'orderId': orderId});
            _logger.i('💡 Used named route navigation');
          } catch (e) {
            _logger.w('⚠️ Named route failed, using path navigation: $e');
            router.go(routerPath);
          }
        } else {
          router.go(routerPath);
        }
        
        // Add delay and check final location
        Future.delayed(const Duration(milliseconds: 200), () {
          _logger.i('💡 Current location after navigation: ${router.routeInformationProvider.value.uri.path}');
          _logger.i('💡 Current location query: ${router.routeInformationProvider.value.uri.query}');
        });
      } else {
        _logger.w('⚠️ Unable to convert deep link to router path: $uri');
      }
    } catch (e) {
      _logger.e('❌ Error handling deep link: $e');
    }
  }

  /// Convert custom URL scheme to router path
  String? _convertToRouterPath(Uri uri) {
    // Handle ecommerce:// scheme
    if (uri.scheme == 'ecommerce') {
      final host = uri.host;
      final pathSegments = uri.pathSegments;
      
      _logger.d('🐛 Scheme: ${uri.scheme}, Host: $host, Path segments: $pathSegments');
      
      // Convert ecommerce://orders/123 to /orders/123
      if (host == 'orders' && pathSegments.isNotEmpty) {
        return '/orders/${pathSegments.first}';
      }
      
      // Convert ecommerce://products/123 to /products/123
      if (host == 'products' && pathSegments.isNotEmpty) {
        return '/products/${pathSegments.first}';
      }
      
      // Handle path-based format: ecommerce://path/to/route
      if (host.isEmpty && pathSegments.isNotEmpty) {
        return '/${pathSegments.join('/')}';
      }
      
      // Handle host-based format with path
      if (host.isNotEmpty) {
        if (pathSegments.isNotEmpty) {
          return '/$host/${pathSegments.join('/')}';
        } else {
          return '/$host';
        }
      }
    }
    
    // Handle standard HTTP/HTTPS URLs
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      return uri.path;
    }
    
    return null;
  }

  /// Dispose the service
  void dispose() {
    _linkSubscription?.cancel();
  }
}
