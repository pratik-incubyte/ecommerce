import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/checkout/presentation/bloc/checkout_bloc.dart';

/// Widget for displaying order summary
class OrderSummarySection extends StatelessWidget {
  final CheckoutState state;
  final VoidCallback onNavigateBack;

  const OrderSummarySection({
    Key? key,
    required this.state,
    required this.onNavigateBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Order Summary',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            state.maybeWhen(
              calculated: (checkout, _) => _buildOrderSummaryContent(checkout),
              promoCodeApplied: (_, checkout) =>
                  _buildOrderSummaryContent(checkout),
              promoCodeRemoved: (checkout) =>
                  _buildOrderSummaryContent(checkout),
              calculating: () => _buildLoadingState(),
              error: (message, _) => _buildErrorState(message),
              orElse: () => _buildEmptyState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummaryContent(Checkout checkout) {
    return Column(
      children: [
        _buildSummaryRow(
          'Subtotal:',
          '\$${checkout.subtotal.toStringAsFixed(2)}',
        ),
        const SizedBox(height: AppConstants.smallPadding),
        _buildSummaryRow(
          'Shipping:',
          '\$${checkout.shippingCost.toStringAsFixed(2)}',
        ),
        const SizedBox(height: AppConstants.smallPadding),
        _buildSummaryRow('Tax:', '\$${checkout.taxAmount.toStringAsFixed(2)}'),
        if (checkout.discountAmount > 0) ...[
          const SizedBox(height: AppConstants.smallPadding),
          _buildSummaryRow(
            'Discount:',
            '-\$${checkout.discountAmount.toStringAsFixed(2)}',
            isDiscount: true,
          ),
        ],
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.smallPadding),
          child: Divider(thickness: 1),
        ),
        _buildSummaryRow(
          'Total:',
          '\$${checkout.totalAmount.toStringAsFixed(2)}',
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.green : null,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isDiscount ? Colors.green : null,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return const Column(
      children: [
        Center(child: CircularProgressIndicator()),
        SizedBox(height: AppConstants.smallPadding),
        Text('Calculating...', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        Icon(Icons.info_outline, size: 32, color: Colors.grey.shade400),
        const SizedBox(height: AppConstants.smallPadding),
        Text(
          'Enter your address to see order summary',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorState(String message) {
    if (message.contains('Cart is empty')) {
      return Column(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 32,
            color: Colors.orange.shade600,
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Text(
            'Your cart is empty',
            style: TextStyle(
              color: Colors.orange.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Add some products to your cart before checkout',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.smallPadding),
          ElevatedButton.icon(
            onPressed: onNavigateBack,
            icon: const Icon(Icons.shopping_bag, size: 16),
            label: const Text('Browse Products'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Icon(Icons.error_outline, size: 32, color: Colors.red.shade400),
        const SizedBox(height: AppConstants.smallPadding),
        Text(
          'Error calculating checkout',
          style: TextStyle(
            color: Colors.red.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          message,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
