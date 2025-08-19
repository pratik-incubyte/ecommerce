import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';
import 'package:ecommerce/src/features/checkout/presentation/widgets/shipping_address_section.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/address.dart';

/// Step 1: Shipping Address
class AddressStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;
  final VoidCallback onChanged;
  final VoidCallback onNext;
  final bool canProceed;

  const AddressStep({
    Key? key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.addressLine1Controller,
    required this.addressLine2Controller,
    required this.cityController,
    required this.stateController,
    required this.postalCodeController,
    required this.countryController,
    required this.onChanged,
    required this.onNext,
    required this.canProceed,
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
                      Icons.location_on,
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
                          'Shipping Address',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Where should we deliver your order?',
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

        // Address form
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: ShippingAddressSection(
                formKey: formKey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                addressLine1Controller: addressLine1Controller,
                addressLine2Controller: addressLine2Controller,
                cityController: cityController,
                stateController: stateController,
                postalCodeController: postalCodeController,
                countryController: countryController,
                onChanged: onChanged,
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
              // Next button
              Flexible(
                child: ElevatedButton.icon(
                  onPressed: canProceed ? onNext : null,
                  icon: const Icon(Icons.arrow_forward, size: 18),
                  label: const Text('Continue'),
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

  /// Check if all required fields are filled
  bool get isValid {
    return firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        addressLine1Controller.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        stateController.text.trim().isNotEmpty &&
        postalCodeController.text.trim().isNotEmpty &&
        countryController.text.trim().isNotEmpty;
  }

  /// Build address from form data
  Address buildAddress() {
    return Address(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      addressLine1: addressLine1Controller.text.trim(),
      addressLine2: addressLine2Controller.text.trim().isNotEmpty
          ? addressLine2Controller.text.trim()
          : null,
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      postalCode: postalCodeController.text.trim(),
      country: countryController.text.trim(),
    );
  }
}
