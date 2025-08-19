import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';

/// Widget for selecting shipping method
class ShippingMethodSection extends StatelessWidget {
  final String selectedShippingMethod;
  final ValueChanged<String> onShippingMethodChanged;

  const ShippingMethodSection({
    Key? key,
    required this.selectedShippingMethod,
    required this.onShippingMethodChanged,
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
              'Shipping Method',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildShippingOption(
              context,
              value: 'standard',
              title: 'Standard Shipping (5-7 days)',
              subtitle: '\$5.99',
              icon: Icons.local_shipping,
            ),
            _buildShippingOption(
              context,
              value: 'express',
              title: 'Express Shipping (2-3 days)',
              subtitle: '\$12.99',
              icon: Icons.speed,
            ),
            _buildShippingOption(
              context,
              value: 'overnight',
              title: 'Overnight Shipping (1 day)',
              subtitle: '\$24.99',
              icon: Icons.flash_on,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingOption(
    BuildContext context, {
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = selectedShippingMethod == value;

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
            fontWeight: FontWeight.w500,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade600,
          ),
        ),
        value: value,
        groupValue: selectedShippingMethod,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (String? newValue) {
          if (newValue != null) {
            onShippingMethodChanged(newValue);
          }
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}
