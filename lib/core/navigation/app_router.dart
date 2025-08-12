import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter({required this.authBloc});

  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: _redirect,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/home',
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: 'forgot-password',
            name: 'forgot-password',
            builder: (context, state) => const ForgotPasswordPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(
          child: child,
          currentPath: state.uri.path,
        ),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'category/:categoryId',
                name: 'category',
                builder: (context, state) {
                  final categoryId = state.pathParameters['categoryId']!;
                  final categoryName = state.uri.queryParameters['name'];
                  return CategoryPage(
                    categoryId: categoryId,
                    categoryName: categoryName,
                  );
                },
              ),
              GoRoute(
                path: 'search',
                name: 'search',
                builder: (context, state) {
                  final query = state.uri.queryParameters['q'];
                  return SearchPage(initialQuery: query);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/products',
            name: 'products',
            builder: (context, state) => const ProductsListPage(),
            routes: [
              GoRoute(
                path: ':productId',
                name: 'product-details',
                builder: (context, state) {
                  final productId = state.pathParameters['productId']!;
                  final referrer = state.uri.queryParameters['ref'];
                  return ProductDetailsPage(
                    productId: productId,
                    referrer: referrer,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'reviews',
                    name: 'product-reviews',
                    builder: (context, state) {
                      final productId = state.pathParameters['productId']!;
                      return ProductReviewsPage(productId: productId);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartPage(),
            routes: [
              GoRoute(
                path: 'checkout',
                name: 'checkout',
                builder: (context, state) {
                  final promoCode = state.uri.queryParameters['promo'];
                  return CheckoutPage(promoCode: promoCode);
                },
                routes: [
                  GoRoute(
                    path: 'payment',
                    name: 'payment',
                    builder: (context, state) => const PaymentPage(),
                  ),
                  GoRoute(
                    path: 'confirmation/:orderId',
                    name: 'order-confirmation',
                    builder: (context, state) {
                      final orderId = state.pathParameters['orderId']!;
                      return OrderConfirmationPage(orderId: orderId);
                    },
                  ),
                ],
              ),
            ],
          ),
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
              GoRoute(
                path: 'addresses',
                name: 'addresses',
                builder: (context, state) => const AddressesPage(),
                routes: [
                  GoRoute(
                    path: 'add',
                    name: 'add-address',
                    builder: (context, state) => const AddAddressPage(),
                  ),
                  GoRoute(
                    path: 'edit/:addressId',
                    name: 'edit-address',
                    builder: (context, state) {
                      final addressId = state.pathParameters['addressId']!;
                      return EditAddressPage(addressId: addressId);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'payment-methods',
                name: 'payment-methods',
                builder: (context, state) => const PaymentMethodsPage(),
              ),
            ],
          ),
          GoRoute(
            path: '/orders',
            name: 'orders',
            builder: (context, state) => const OrdersListPage(),
            routes: [
              GoRoute(
                path: ':orderId',
                name: 'order-details',
                builder: (context, state) {
                  final orderId = state.pathParameters['orderId']!;
                  return OrderDetailsPage(orderId: orderId);
                },
                routes: [
                  GoRoute(
                    path: 'track',
                    name: 'track-order',
                    builder: (context, state) {
                      final orderId = state.pathParameters['orderId']!;
                      return TrackOrderPage(orderId: orderId);
                    },
                  ),
                  GoRoute(
                    path: 'return',
                    name: 'return-order',
                    builder: (context, state) {
                      final orderId = state.pathParameters['orderId']!;
                      return ReturnOrderPage(orderId: orderId);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/wishlist',
            name: 'wishlist',
            builder: (context, state) => const WishlistPage(),
          ),
          GoRoute(
            path: '/deals',
            name: 'deals',
            builder: (context, state) {
              final category = state.uri.queryParameters['category'];
              return DealsPage(category: category);
            },
          ),
        ],
      ),
      // Special promo/campaign deep links
      GoRoute(
        path: '/promo/:promoCode',
        name: 'promo',
        redirect: (context, state) {
          final promoCode = state.pathParameters['promoCode'];
          return '/cart/checkout?promo=$promoCode';
        },
      ),
      // Share links for products
      GoRoute(
        path: '/share/product/:productId',
        name: 'share-product',
        redirect: (context, state) {
          final productId = state.pathParameters['productId'];
          return '/products/$productId?ref=share';
        },
      ),
      // Email verification link
      GoRoute(
        path: '/verify-email',
        name: 'verify-email',
        builder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return EmailVerificationPage(token: token);
        },
      ),
      // Password reset link
      GoRoute(
        path: '/reset-password',
        name: 'reset-password',
        builder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return ResetPasswordPage(token: token);
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(
      error: state.error,
      path: state.uri.path,
    ),
  );

  String? _redirect(BuildContext context, GoRouterState state) {
    final authState = authBloc.state;
    final isLoggedIn = authState is Authenticated;
    final loggingIn = state.matchedLocation == '/login' ||
        state.matchedLocation == '/signup';
    
    // Public routes that don't require authentication
    final publicRoutes = [
      '/home',
      '/products',
      '/deals',
      '/verify-email',
      '/reset-password',
      '/login/forgot-password',
    ];
    
    // Check if current path is public or starts with a public route
    final isPublicRoute = publicRoutes.any((route) => 
      state.matchedLocation == route || 
      state.matchedLocation.startsWith('$route/') ||
      state.matchedLocation.startsWith('/products/') ||
      state.matchedLocation.startsWith('/share/')
    );

    // Protected routes that require authentication
    final protectedRoutes = [
      '/cart/checkout',
      '/profile',
      '/orders',
      '/wishlist',
    ];
    
    final isProtectedRoute = protectedRoutes.any((route) => 
      state.matchedLocation.startsWith(route)
    );

    // If not logged in and trying to access protected route
    if (!isLoggedIn && isProtectedRoute) {
      // Save the intended location to redirect after login
      return '/login?redirect=${Uri.encodeComponent(state.matchedLocation)}';
    }

    // If logged in and on login/signup page
    if (isLoggedIn && loggingIn) {
      // Check if there's a redirect parameter
      final redirect = state.uri.queryParameters['redirect'];
      if (redirect != null && redirect.isNotEmpty) {
        return Uri.decodeComponent(redirect);
      }
      return '/home';
    }

    return null;
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AuthState> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// Shell widget to handle bottom navigation
class MainShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const MainShell({
    super.key,
    required this.child,
    required this.currentPath,
  });

  int _getSelectedIndex() {
    if (currentPath.startsWith('/home')) return 0;
    if (currentPath.startsWith('/products')) return 1;
    if (currentPath.startsWith('/cart')) return 2;
    if (currentPath.startsWith('/orders')) return 3;
    if (currentPath.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _getSelectedIndex(),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/products');
              break;
            case 2:
              context.go('/cart');
              break;
            case 3:
              context.go('/orders');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
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
}

// Placeholder pages (implement these in their respective feature folders)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-Commerce')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to E-Commerce App'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/products/123?ref=home'),
              child: const Text('View Product 123'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/deals?category=electronics'),
              child: const Text('Electronics Deals'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: const Center(child: Text('Products List')),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  final String? referrer;

  const ProductDetailsPage({
    super.key,
    required this.productId,
    this.referrer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $productId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product ID: $productId'),
            if (referrer != null) Text('Referred from: $referrer'),
            ElevatedButton(
              onPressed: () => context.go('/products/$productId/reviews'),
              child: const Text('View Reviews'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/cart/checkout'),
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final String? promoCode;

  const CheckoutPage({super.key, this.promoCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Checkout Page'),
            if (promoCode != null) Text('Promo Code: $promoCode'),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Page')),
    );
  }
}

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: const Center(child: Text('Orders List')),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final String orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order $orderId')),
      body: Center(child: Text('Order ID: $orderId')),
    );
  }
}

class ErrorPage extends StatelessWidget {
  final Exception? error;
  final String? path;

  const ErrorPage({super.key, this.error, this.path});

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
            Text('Error: ${error?.toString() ?? 'Page not found'}'),
            if (path != null) Text('Path: $path'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// Additional placeholder pages
class CategoryPage extends StatelessWidget {
  final String categoryId;
  final String? categoryName;

  const CategoryPage({
    super.key,
    required this.categoryId,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName ?? 'Category')),
      body: Center(child: Text('Category ID: $categoryId')),
    );
  }
}

class SearchPage extends StatelessWidget {
  final String? initialQuery;

  const SearchPage({super.key, this.initialQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Center(child: Text('Search: ${initialQuery ?? 'All products'}')),
    );
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: const Center(child: Text('Wishlist')),
    );
  }
}

class DealsPage extends StatelessWidget {
  final String? category;

  const DealsPage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deals')),
      body: Center(child: Text('Deals: ${category ?? 'All'}')),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(child: Text('Forgot Password')),
    );
  }
}

class EmailVerificationPage extends StatelessWidget {
  final String? token;

  const EmailVerificationPage({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Center(child: Text('Token: ${token ?? 'Invalid'}')),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  final String? token;

  const ResetPasswordPage({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Center(child: Text('Token: ${token ?? 'Invalid'}')),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: const Center(child: Text('Payment')),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  final String orderId;

  const OrderConfirmationPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed')),
      body: Center(child: Text('Order $orderId confirmed!')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings')),
    );
  }
}

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Addresses')),
      body: const Center(child: Text('Addresses')),
    );
  }
}

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Address')),
      body: const Center(child: Text('Add Address')),
    );
  }
}

class EditAddressPage extends StatelessWidget {
  final String addressId;

  const EditAddressPage({super.key, required this.addressId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Address')),
      body: Center(child: Text('Edit Address: $addressId')),
    );
  }
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods')),
      body: const Center(child: Text('Payment Methods')),
    );
  }
}

class ProductReviewsPage extends StatelessWidget {
  final String productId;

  const ProductReviewsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: Center(child: Text('Reviews for Product: $productId')),
    );
  }
}

class TrackOrderPage extends StatelessWidget {
  final String orderId;

  const TrackOrderPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track Order')),
      body: Center(child: Text('Tracking Order: $orderId')),
    );
  }
}

class ReturnOrderPage extends StatelessWidget {
  final String orderId;

  const ReturnOrderPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Return Order')),
      body: Center(child: Text('Return Order: $orderId')),
    );
  }
}