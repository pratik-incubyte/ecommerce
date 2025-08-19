import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(
                  'product-details',
                  pathParameters: {'productId': '${cartItem.product.id}'},
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultBorderRadius,
                  ),
                  color: Colors.grey[100],
                ),
                child: cartItem.product.images.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppConstants.defaultBorderRadius,
                        ),
                        child: Image.network(
                          cartItem.product.images.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 32,
                              color: Colors.grey,
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Icon(Icons.image, size: 32, color: Colors.grey),
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).goNamed(
                        'product-details',
                        pathParameters: {'productId': '${cartItem.product.id}'},
                      );
                    },
                    child: Text(
                      cartItem.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Brand (if available)
                  if (cartItem.product.brand.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      cartItem.product.brand,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],

                  const SizedBox(height: AppConstants.smallPadding),

                  // Price
                  Text(
                    '\$${cartItem.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  // Selected Variants (if any)
                  if (cartItem.selectedVariants != null &&
                      cartItem.selectedVariants!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: cartItem.selectedVariants!.entries.map((entry) {
                        return Chip(
                          label: Text(
                            '${entry.key}: ${entry.value}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          visualDensity: VisualDensity.compact,
                        );
                      }).toList(),
                    ),
                  ],

                  const SizedBox(height: AppConstants.defaultPadding),

                  // Quantity Controls and Remove Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(
                            AppConstants.defaultBorderRadius,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: cartItem.quantity > 1
                                  ? () =>
                                        onQuantityChanged(cartItem.quantity - 1)
                                  : null,
                              icon: const Icon(Icons.remove),
                              iconSize: 20,
                              constraints: const BoxConstraints.tightFor(
                                width: 36,
                                height: 36,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '${cartItem.quantity}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: cartItem.quantity < 99
                                  ? () =>
                                        onQuantityChanged(cartItem.quantity + 1)
                                  : null,
                              icon: const Icon(Icons.add),
                              iconSize: 20,
                              constraints: const BoxConstraints.tightFor(
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Remove Button
                      IconButton(
                        onPressed: () => _showRemoveDialog(context),
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.red[600],
                        tooltip: 'Remove from cart',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text('Remove "${cartItem.product.title}" from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              onRemove();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}
