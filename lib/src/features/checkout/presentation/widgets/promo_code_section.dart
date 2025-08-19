import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';

/// Widget for promo code input
class PromoCodeSection extends StatelessWidget {
  final TextEditingController promoCodeController;
  final VoidCallback? onChanged;

  const PromoCodeSection({
    Key? key,
    required this.promoCodeController,
    this.onChanged,
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
              'Promo Code',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            TextFormField(
              controller: promoCodeController,
              decoration: const InputDecoration(
                labelText: 'Enter promo code',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.local_offer),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              textCapitalization: TextCapitalization.characters,
              onChanged: onChanged != null ? (_) => onChanged!() : null,
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.blue.shade600,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Try: SAVE10, SAVE20, FLAT5, WELCOME',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
