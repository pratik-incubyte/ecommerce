import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/payment_method_section.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/promo_code_section.dart';

/// Step 3: Payment Method
class PaymentStep extends StatelessWidget {
  final String selectedPaymentMethod;
  final ValueChanged<String> onPaymentMethodChanged;
  final TextEditingController promoCodeController;
  final VoidCallback? onPromoCodeChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const PaymentStep({
    Key? key,
    required this.selectedPaymentMethod,
    required this.onPaymentMethodChanged,
    required this.promoCodeController,
    this.onPromoCodeChanged,
    required this.onNext,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Icons.payment,
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
                          'Payment & Promo',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'How would you like to pay?',
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

        // Payment options and promo code
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  PaymentMethodSection(
                    selectedPaymentMethod: selectedPaymentMethod,
                    onPaymentMethodChanged: onPaymentMethodChanged,
                  ),
                  const SizedBox(height: AppConstants.largePadding),
                  PromoCodeSection(
                    promoCodeController: promoCodeController,
                    onChanged: onPromoCodeChanged,
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
              Flexible(
                child: OutlinedButton.icon(
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
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              // Progress indicator
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Step 3 of 4',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              // Next button
              Flexible(
                child: ElevatedButton.icon(
                  onPressed: onNext,
                  icon: const Icon(Icons.arrow_forward, size: 18),
                  label: const Text('Review Order'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
