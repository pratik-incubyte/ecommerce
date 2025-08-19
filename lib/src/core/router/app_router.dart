import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Features
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/products/presentation/pages/product_details_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/orders/presentation/pages/order_details_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';

// Core
import '../di/injection_container.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../widgets/auth_wrapper.dart';

/// Application router configuration
class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true, // Enable debugging
    routes: [
      // Standalone deep link routes (work outside shell navigation)
      GoRoute(
        path: '/products/:productId',
        name: 'product-details-standalone',
        builder: (context, state) {
          final productId = state.pathParameters['productId']!;
          
          return BlocProvider(
            create: (_) => getIt<AuthBloc>(),
            child: AuthWrapper(
              child: ProductDetailsPage(
                productId: productId,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: '/orders/:orderId',
        name: 'order-details-standalone',
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          final userId = state.uri.queryParameters['userId'];
          
          return BlocProvider(
            create: (_) => getIt<AuthBloc>(),
            child: AuthWrapper(
              child: OrderDetailsPage(
                orderId: orderId,
                userId: userId,
              ),
            ),
          );
        },
      ),
      // Auth route
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const AuthPage(),
        ),
      ),

      // Shell route for main navigation (protected routes)
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AuthWrapper(child: MainShell(child: child));
        },
        routes: [
          // Home/Products route
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const ProductsPage(),
            routes: [
              // Product details
              GoRoute(
                path: 'product/:productId',
                name: 'product-details',
                builder: (context, state) {
                  final productId = state.pathParameters['productId']!;
                  return ProductDetailsPage(productId: productId);
                },
              ),
            ],
          ),

          // Cart route
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartPage(),
          ),

          // Orders route
          GoRoute(
            path: '/orders',
            name: 'orders',
            builder: (context, state) => const OrdersPage(),
            routes: [
              // Order details
              GoRoute(
                path: ':orderId',
                name: 'order-details',
                builder: (context, state) {
                  final orderId = state.pathParameters['orderId']!;
                  final userId = state.uri.queryParameters['userId'];
                  return OrderDetailsPage(orderId: orderId, userId: userId);
                },
              ),
            ],
          ),
          // Profile route
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: 'settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authBloc = getIt<AuthBloc>();
      final isAuthRoute = state.uri.path == '/auth';
      
      // Handle custom scheme deep links - GoRouter parses ecommerce://products/1 as host=products, path=/1
      String actualPath = state.uri.path;
      if (state.uri.scheme == 'ecommerce' && state.uri.host.isNotEmpty) {
        // Convert ecommerce://products/1 to /products/1
        actualPath = '/${state.uri.host}${state.uri.path}';
      }
      
      final isDeepLink = actualPath.startsWith('/orders/') || 
                        actualPath.startsWith('/products/');
      
      // Debug log for deep link handling
      print('🚀 Router redirect - Full URI: ${state.uri.toString()}');
      print('🚀 Router redirect - Original Path: ${state.uri.path}');
      print('🚀 Router redirect - Host: ${state.uri.host}');
      print('🚀 Router redirect - Actual Path: $actualPath');
      print('🚀 Router redirect - Query: ${state.uri.query}');
      print('🚀 Router redirect - IsAuthRoute: $isAuthRoute, IsDeepLink: $isDeepLink');
      print('🚀 Router redirect - Auth state: ${authBloc.state}');
      
      // If this is a custom scheme deep link, redirect to the correct path
      if (state.uri.scheme == 'ecommerce' && state.uri.host.isNotEmpty) {
        print('🚀 Redirecting custom scheme to: $actualPath');
        return actualPath;
      }

      return authBloc.state.when(
        initial: () {
          // Check auth status on initial load
          authBloc.add(const AuthEvent.checkAuthStatus());
          return null;
        },
        loading: () => null, // Let loading state handle navigation
        authenticated: (user) {
          // User is authenticated
          if (isAuthRoute) {
            return '/'; // Redirect to home if trying to access auth page
          }
          return null; // Allow access to other routes
        },
        unauthenticated: () {
          // User is not authenticated
          if (!isAuthRoute && !isDeepLink) {
            return '/auth'; // Redirect to auth page, but allow deep links
          }
          return null; // Allow access to auth page and deep links
        },
        error: (message) {
          // On error, redirect to auth page unless it's a deep link
          if (!isAuthRoute && !isDeepLink) {
            return '/auth';
          }
          return null;
        },
      );
    },
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
}

/// Main shell widget with bottom navigation
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.path;
    if (location.startsWith('/cart')) return 1;
    if (location.startsWith('/orders')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed('home');
        break;
      case 1:
        GoRouter.of(context).goNamed('cart');
        break;
      case 2:
        GoRouter.of(context).goNamed('orders');
        break;
      case 3:
        GoRouter.of(context).goNamed('profile');
        break;
    }
  }
}

/// Error page for navigation errors
class ErrorPage extends StatelessWidget {
  final Exception? error;

  const ErrorPage({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Page not found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'Unknown error occurred',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).goNamed('home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
