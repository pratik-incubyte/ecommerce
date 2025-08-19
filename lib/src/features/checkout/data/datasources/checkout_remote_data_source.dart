import 'package:ecommerce/src/core/error/exceptions.dart';

/// Remote data source for checkout operations
abstract class CheckoutRemoteDataSource {
  /// Calculate shipping costs
  Future<double> calculateShipping({
    required Map<String, dynamic> address,
    required String shippingMethod,
    required double weight,
  });

  /// Calculate tax amount
  Future<double> calculateTax({
    required double subtotal,
    required Map<String, dynamic> address,
  });

  /// Apply promo code
  Future<Map<String, dynamic>> applyPromoCode({
    required String promoCode,
    required double subtotal,
  });

  /// Validate address
  Future<bool> validateAddress({required Map<String, dynamic> address});

  /// Get available shipping methods
  Future<List<Map<String, dynamic>>> getShippingMethods({
    required Map<String, dynamic> address,
    required double weight,
  });

  /// Process payment (dummy implementation - always succeeds for testing)
  Future<Map<String, dynamic>> processPayment({
    required String paymentMethod,
    required double amount,
    required Map<String, dynamic> paymentDetails,
  });
}

/// Implementation of remote data source for checkout
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  CheckoutRemoteDataSourceImpl();

  @override
  Future<double> calculateShipping({
    required Map<String, dynamic> address,
    required String shippingMethod,
    required double weight,
  }) async {
    try {
      // Dummy shipping calculation
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // Simulate API call

      switch (shippingMethod.toLowerCase()) {
        case 'standard':
          return 5.99;
        case 'express':
          return 12.99;
        case 'overnight':
          return 24.99;
        case 'pickup':
          return 0.0;
        default:
          return 5.99;
      }
    } catch (e) {
      throw ServerException('Failed to calculate shipping: ${e.toString()}');
    }
  }

  @override
  Future<double> calculateTax({
    required double subtotal,
    required Map<String, dynamic> address,
  }) async {
    try {
      // Dummy tax calculation (10% tax rate)
      await Future.delayed(
        const Duration(milliseconds: 300),
      ); // Simulate API call

      final taxRate = 0.10; // 10% tax
      return subtotal * taxRate;
    } catch (e) {
      throw ServerException('Failed to calculate tax: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> applyPromoCode({
    required String promoCode,
    required double subtotal,
  }) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 400),
      ); // Simulate API call

      // Dummy promo code validation
      const validPromoCodes = {
        'SAVE10': {
          'type': 'percentage',
          'value': 0.10,
          'description': '10% off',
        },
        'SAVE20': {
          'type': 'percentage',
          'value': 0.20,
          'description': '20% off',
        },
        'FLAT5': {'type': 'fixed', 'value': 5.0, 'description': '\$5 off'},
        'WELCOME': {
          'type': 'percentage',
          'value': 0.15,
          'description': '15% off for new customers',
        },
      };

      final promoData = validPromoCodes[promoCode.toUpperCase()];

      if (promoData == null) {
        throw ServerException('Invalid promo code');
      }

      double discountAmount;
      if (promoData['type'] == 'percentage') {
        discountAmount = subtotal * (promoData['value'] as double);
      } else {
        discountAmount = promoData['value'] as double;
      }

      // Ensure discount doesn't exceed subtotal
      discountAmount = discountAmount > subtotal ? subtotal : discountAmount;

      return {
        'isValid': true,
        'code': promoCode.toUpperCase(),
        'description': promoData['description'],
        'discountAmount': discountAmount,
        'type': promoData['type'],
        'value': promoData['value'],
      };
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to apply promo code: ${e.toString()}');
    }
  }

  @override
  Future<bool> validateAddress({required Map<String, dynamic> address}) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 200),
      ); // Simulate API call

      // Dummy address validation
      final requiredFields = [
        'firstName',
        'lastName',
        'addressLine1',
        'city',
        'state',
        'postalCode',
        'country',
      ];

      for (final field in requiredFields) {
        if (address[field] == null ||
            address[field].toString().trim().isEmpty) {
          return false;
        }
      }

      // Additional validation logic could go here
      return true;
    } catch (e) {
      throw ServerException('Failed to validate address: ${e.toString()}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getShippingMethods({
    required Map<String, dynamic> address,
    required double weight,
  }) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 600),
      ); // Simulate API call

      // Dummy shipping methods
      return [
        {
          'id': 'standard',
          'name': 'Standard Shipping',
          'description': '5-7 business days',
          'price': 5.99,
          'estimatedDays': '5-7',
        },
        {
          'id': 'express',
          'name': 'Express Shipping',
          'description': '2-3 business days',
          'price': 12.99,
          'estimatedDays': '2-3',
        },
        {
          'id': 'overnight',
          'name': 'Overnight Shipping',
          'description': 'Next business day',
          'price': 24.99,
          'estimatedDays': '1',
        },
        {
          'id': 'pickup',
          'name': 'Store Pickup',
          'description': 'Pick up at store',
          'price': 0.0,
          'estimatedDays': '0',
        },
      ];
    } catch (e) {
      throw ServerException('Failed to get shipping methods: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> processPayment({
    required String paymentMethod,
    required double amount,
    required Map<String, dynamic> paymentDetails,
  }) async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate payment processing

      // DUMMY IMPLEMENTATION - Always succeeds for testing purposes
      // In a real implementation, this would:
      // 1. Validate payment details
      // 2. Connect to payment gateway (Stripe, PayPal, etc.)
      // 3. Handle real payment processing
      // 4. Return actual transaction results
      final transactionId = 'txn_${DateTime.now().millisecondsSinceEpoch}';

      print(
        'Dummy payment processing for ${paymentMethod}: \$${amount.toStringAsFixed(2)}',
      );

      return {
        'success': true,
        'transactionId': transactionId,
        'paymentMethod': paymentMethod,
        'amount': amount,
        'status': 'completed',
        'processedAt': DateTime.now().toIso8601String(),
        'message': 'Payment processed successfully (dummy mode)',
        'cardLast4':
            paymentDetails['cardNumber']?.toString().substring(12) ?? '1111',
        'authCode':
            'AUTH_${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
      };
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Payment processing failed: ${e.toString()}');
    }
  }
}
