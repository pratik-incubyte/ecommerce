import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/product_details_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductDetailsBloc>()
            ..add(
              ProductDetailsEvent.getProductDetails(
                productId: int.parse(productId),
              ),
            ),
        ),
        BlocProvider(
          create: (_) {
            final cartBloc = getIt<CartBloc>();
            // Load cart on initialization to get current cart count
            return cartBloc;
          },
        ),
      ],
      child: ProductDetailsView(productId: productId),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  final String productId;

  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = 0;
              state.maybeWhen(
                loaded: (cart, count) => itemCount = count,
                orElse: () {},
              );

              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      GoRouter.of(context).goNamed('cart');
                    },
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          state.maybeWhen(
            addedToCart: (cartItem, updatedCart) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${cartItem.product.title} added to cart'),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'View Cart',
                    onPressed: () {
                      GoRouter.of(context).goNamed('cart');
                    },
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            error: (message, cart) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, cartState) {
          return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Loading product...')),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (product) =>
                    _buildProductDetails(context, product, cartState),
                error: (message) => _buildErrorState(context, message),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (product) =>
                    _buildBottomBar(context, product, cartState),
                orElse: () => const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductDetails(
    BuildContext context,
    dynamic product,
    CartState cartState,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: product.images.isNotEmpty
                ? Image.network(
                    product.images.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.grey,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                : const Icon(Icons.image, size: 100, color: Colors.grey),
          ),

          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: AppConstants.smallPadding),

                // Brand
                if (product.brand.isNotEmpty) ...[
                  Text(
                    product.brand,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                ],

                // Product Price and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (product.rating > 0)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[600], size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '${product.rating.toStringAsFixed(1)} (${(product.rating * 100).toInt()} reviews)',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                const SizedBox(height: AppConstants.defaultPadding),

                // Product Description
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: AppConstants.smallPadding),

                Text(
                  product.description.isNotEmpty
                      ? product.description
                      : 'This is a sample product description. It would contain details about the product features, specifications, and other relevant information.',
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),

                const SizedBox(height: AppConstants.largePadding),

                // SKU
                if (product.sku.isNotEmpty) ...[
                  Row(
                    children: [
                      const Text(
                        'SKU: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(product.sku),
                    ],
                  ),
                  const SizedBox(height: AppConstants.largePadding),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              'Error loading product',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              message,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.largePadding),
            ElevatedButton.icon(
              onPressed: () {
                context.read<ProductDetailsBloc>().add(
                  ProductDetailsEvent.getProductDetails(
                    productId: int.parse(productId),
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    dynamic product,
    CartState cartState,
  ) {
    final isAddingToCart = cartState.maybeWhen(
      addingToCart: () => true,
      orElse: () => false,
    );

    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  final userId = authState.maybeWhen(
                    authenticated: (user) => user.id,
                    orElse: () => 'user123', // Fallback for development
                  );

                  return ElevatedButton.icon(
                    onPressed: isAddingToCart
                        ? null
                        : () {
                            context.read<CartBloc>().add(
                              CartEvent.addToCart(
                                userId: userId,
                                product: product,
                                quantity: 1,
                              ),
                            );
                          },
                    icon: isAddingToCart
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.add_shopping_cart),
                    label: Text(isAddingToCart ? 'Adding...' : 'Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.defaultPadding,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Wishlist feature coming soon!'),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('Wishlist'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.defaultPadding,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
