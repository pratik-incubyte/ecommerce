import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/product.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>(),
      child: ProductCardView(product: product),
    );
  }
}

class ProductCardView extends StatelessWidget {
  final Product product;

  const ProductCardView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          addedToCart: (cartItem, updatedCart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${cartItem.product.title} added to cart'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'View Cart',
                  onPressed: () {
                    GoRouter.of(context).goNamed('cart');
                  },
                ),
              ),
            );
          },
          error: (message, cart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    'product-details',
                    pathParameters: {'productId': '${product.id}'},
                  );
                },
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppConstants.defaultBorderRadius),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppConstants.defaultBorderRadius),
                    ),
                    color: Colors.grey[100],
                  ),
                  child: product.images.isNotEmpty
                      ? ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(
                              AppConstants.defaultBorderRadius,
                            ),
                          ),
                          child: Image.network(
                            product.images.first,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 48,
                                color: Colors.grey,
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        )
                      : const Icon(Icons.image, size: 48, color: Colors.grey),
                ),
              ),
            ),

            // Product Details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title - tappable
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          'product-details',
                          pathParameters: {'productId': '${product.id}'},
                        );
                      },
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (product.brand.isNotEmpty) ...[
                      Text(
                        product.brand,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                    ],
                    const Spacer(),

                    // Price and Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (product.rating > 0) ...[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber[600],
                              ),
                              const SizedBox(width: 2),
                              Text(
                                product.rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),

                    const SizedBox(height: AppConstants.smallPadding),

                    // Add to Cart Button
                    //   SizedBox(
                    //     width: double.infinity,
                    //     child: BlocBuilder<CartBloc, CartState>(
                    //       builder: (context, state) {
                    //         final isAddingToCart = state.maybeWhen(
                    //           addingToCart: () => true,
                    //           orElse: () => false,
                    //         );

                    //         return ElevatedButton.icon(
                    //           onPressed: isAddingToCart
                    //               ? null
                    //               : () {
                    //                   context.read<CartBloc>().add(
                    //                     CartEvent.addToCart(
                    //                       userId:
                    //                           'user123', // TODO: Get real user ID
                    //                       product: product,
                    //                       quantity: 1,
                    //                     ),
                    //                   );
                    //                 },
                    //           icon: isAddingToCart
                    //               ? const SizedBox(
                    //                   width: 12,
                    //                   height: 12,
                    //                   child: CircularProgressIndicator(
                    //                     strokeWidth: 1.5,
                    //                     color: Colors.white,
                    //                   ),
                    //                 )
                    //               : const Icon(Icons.add_shopping_cart, size: 16),
                    //           label: Text(
                    //             isAddingToCart ? 'Adding...' : 'Add to Cart',
                    //             style: const TextStyle(fontSize: 12),
                    //           ),
                    //           style: ElevatedButton.styleFrom(
                    //             padding: const EdgeInsets.symmetric(
                    //               vertical: 8,
                    //               horizontal: 12,
                    //             ),
                    //             minimumSize: const Size(0, 32),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
