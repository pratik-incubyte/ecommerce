import 'package:flutter/material.dart';
import 'package:ecommerce/src/core/constants/app_constants.dart';

/// Widget for handling shipping address input
class ShippingAddressSection extends StatelessWidget {
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

  const ShippingAddressSection({
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
              'Shipping Address',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildNameFields(),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildAddressFields(),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildCityStateFields(),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildPostalCountryFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              labelText: 'Last Name',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressFields() {
    return Column(
      children: [
        TextFormField(
          controller: addressLine1Controller,
          decoration: const InputDecoration(
            labelText: 'Address Line 1',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        TextFormField(
          controller: addressLine2Controller,
          decoration: const InputDecoration(
            labelText: 'Address Line 2 (Optional)',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onChanged: (_) => onChanged(),
        ),
      ],
    );
  }

  Widget _buildCityStateFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: cityController,
            decoration: const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: TextFormField(
            controller: stateController,
            decoration: const InputDecoration(
              labelText: 'State',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your state';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
      ],
    );
  }

  Widget _buildPostalCountryFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: postalCodeController,
            decoration: const InputDecoration(
              labelText: 'Postal Code',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your postal code';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: TextFormField(
            controller: countryController,
            decoration: const InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your country';
              }
              return null;
            },
            onChanged: (_) => onChanged(),
          ),
        ),
      ],
    );
  }
}
