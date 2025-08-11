import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Features
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/products/presentation/pages/product_details_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';

// Core
import '../di/injection_container.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

/// Application router configuration
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  
  static GoRouter get router => _router;
  
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<AuthBloc>(),
          child: const RegisterPage(),
        ),
      ),
      
      // Shell route for main navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainShell(child: child);
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
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Add authentication logic here if needed
      return null;
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  
  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouter.of(context).routeInformationProvider.value.uri.path;
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
        // GoRouter.of(context).goNamed('profile');
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
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 64,
              color: Colors.red,
            ),
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
