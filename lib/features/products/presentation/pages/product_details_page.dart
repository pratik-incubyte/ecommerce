import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  
  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              GoRouter.of(context).goNamed('cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(
                Icons.image,
                size: 100,
                color: Colors.grey,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    'Product $productId',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: AppConstants.smallPadding),
                  
                  // Product Price
                  Text(
                    '\$${int.parse(productId) * 10}.99',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: AppConstants.defaultPadding),
                  
                  // Product Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: AppConstants.smallPadding),
                  
                  const Text(
                    'This is a sample product description. It would contain details about the product features, specifications, and other relevant information.',
                    style: TextStyle(fontSize: 16),
                  ),
                  
                  const SizedBox(height: AppConstants.largePadding),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart!'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ),
            const SizedBox(width: AppConstants.defaultPadding),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to wishlist!'),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('Wishlist'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
