import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/order_summary_section.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/checkout_button_section.dart';
import 'package:ecommerce/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/address.dart';

/// Step 4: Review and Confirm Order
class ReviewStep extends StatelessWidget {
  final CheckoutState state;
  final GlobalKey<FormState> formKey;
  final Address shippingAddress;
  final String selectedShippingMethod;
  final String selectedPaymentMethod;
  final String promoCode;
  final VoidCallback onPlaceOrder;
  final VoidCallback onBack;
  final VoidCallback onNavigateBack;
  final VoidCallback? onTriggerCalculation;

  const ReviewStep({
    Key? key,
    required this.state,
    required this.formKey,
    required this.shippingAddress,
    required this.selectedShippingMethod,
    required this.selectedPaymentMethod,
    required this.promoCode,
    required this.onPlaceOrder,
    required this.onBack,
    required this.onNavigateBack,
    this.onTriggerCalculation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Trigger calculation if needed and we have valid address data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_shouldTriggerCalculation() &&
          _hasValidAddressData() &&
          onTriggerCalculation != null) {
        onTriggerCalculation!();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step header
        Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.preview,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Review Order',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Please review your order before placing it',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Review content
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  // Shipping Address Review
                  _buildShippingAddressReview(context),
                  const SizedBox(height: AppConstants.defaultPadding),

                  // Shipping & Payment Methods Review
                  _buildMethodsReview(context),
                  const SizedBox(height: AppConstants.defaultPadding),

                  // Order Summary
                  OrderSummarySection(
                    state: state,
                    onNavigateBack: onNavigateBack,
                  ),

                  // Fallback message if order summary is empty
                  if (state.maybeWhen(
                    initial: () => true,
                    calculating: () => false,
                    orElse: () => false,
                  ))
                    Container(
                      margin: const EdgeInsets.only(
                        top: AppConstants.defaultPadding,
                      ),
                      padding: const EdgeInsets.all(
                        AppConstants.defaultPadding,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue.shade600,
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Order Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Your order details will be calculated when you place the order',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        // Navigation buttons
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              // Back button
              OutlinedButton.icon(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Back'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
              SizedBox(width: AppConstants.defaultPadding),
              // Place Order button
              Expanded(
                child: CheckoutButtonSection(
                  state: state,
                  formKey: formKey,
                  onCheckout: onPlaceOrder,
                  forceEnable: _hasValidAddressData() || _shouldForceEnable(),
                  buttonText: _getButtonText(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingAddressReview(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              shippingAddress.fullName,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(shippingAddress.formattedAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodsReview(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Method
            Row(
              children: [
                Icon(
                  Icons.local_shipping,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Shipping Method',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(_getShippingMethodName(selectedShippingMethod)),

            const SizedBox(height: AppConstants.defaultPadding),
            const Divider(),
            const SizedBox(height: AppConstants.defaultPadding),

            // Payment Method
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(_getPaymentMethodName(selectedPaymentMethod)),

            // Promo Code (if applied)
            if (promoCode.isNotEmpty) ...[
              const SizedBox(height: AppConstants.defaultPadding),
              const Divider(),
              const SizedBox(height: AppConstants.defaultPadding),
              Row(
                children: [
                  Icon(
                    Icons.local_offer,
                    size: 20,
                    color: Colors.green.shade600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Promo Code Applied',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                promoCode,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getShippingMethodName(String method) {
    switch (method) {
      case 'standard':
        return 'Standard Shipping (5-7 days) - \$5.99';
      case 'express':
        return 'Express Shipping (2-3 days) - \$12.99';
      case 'overnight':
        return 'Overnight Shipping (1 day) - \$24.99';
      default:
        return 'Standard Shipping (5-7 days) - \$5.99';
    }
  }

  String _getPaymentMethodName(String method) {
    switch (method) {
      case 'credit_card':
        return 'Credit Card';
      case 'paypal':
        return 'PayPal';
      default:
        return 'Credit Card';
    }
  }

  bool _hasValidAddressData() {
    return shippingAddress.firstName.trim().isNotEmpty &&
        shippingAddress.lastName.trim().isNotEmpty &&
        shippingAddress.addressLine1.trim().isNotEmpty &&
        shippingAddress.city.trim().isNotEmpty &&
        shippingAddress.state.trim().isNotEmpty &&
        shippingAddress.postalCode.trim().isNotEmpty &&
        shippingAddress.country.trim().isNotEmpty;
  }

  bool _shouldTriggerCalculation() {
    return state.maybeWhen(
      initial: () => true,
      error: (_, __) => true,
      calculating: () => false, // Don't trigger if already calculating
      orElse: () => false, // Already in a good state
    );
  }

  bool _shouldForceEnable() {
    // Force enable the button in certain states
    return state.maybeWhen(
      error: (_, __) => true, // Allow retry on error
      initial: () => true, // Allow initial attempt
      orElse: () => false,
    );
  }

  String? _getButtonText() {
    return state.maybeWhen(
      error: (message, __) => 'Retry Order',
      calculating: () => null, // Let the button show loading state
      orElse: () => null, // Use default text
    );
  }
}
