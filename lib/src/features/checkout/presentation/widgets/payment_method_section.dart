import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';

/// Widget for selecting payment method
class PaymentMethodSection extends StatelessWidget {
  final String selectedPaymentMethod;
  final ValueChanged<String> onPaymentMethodChanged;

  const PaymentMethodSection({
    Key? key,
    required this.selectedPaymentMethod,
    required this.onPaymentMethodChanged,
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
            Text(
              'Payment Method',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildPaymentOption(
              context,
              value: 'credit_card',
              title: 'Credit Card',
              subtitle: 'Visa, Mastercard, American Express',
              icon: Icons.credit_card,
            ),
            _buildPaymentOption(
              context,
              value: 'paypal',
              title: 'PayPal',
              subtitle: 'Pay with your PayPal account',
              icon: Icons.account_balance_wallet,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = selectedPaymentMethod == value;

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? Theme.of(context).primaryColor.withOpacity(0.05)
            : null,
      ),
      child: RadioListTile<String>(
        title: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? Theme.of(context).primaryColor : null,
                ),
              ),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade600,
          ),
        ),
        value: value,
        groupValue: selectedPaymentMethod,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (String? newValue) {
          if (newValue != null) {
            onPaymentMethodChanged(newValue);
          }
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}
