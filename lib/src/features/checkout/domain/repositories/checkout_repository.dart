import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';

/// Checkout repository interface
abstract class CheckoutRepository {
  /// Calculate checkout totals including tax and shipping
  Future<Either<Failure, Checkout>> calculateCheckout({
    required String userId,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
    String? promoCode,
  });

  /// Process payment (dummy implementation)
  Future<Either<Failure, Map<String, dynamic>>> processPayment({
    required String paymentMethod,
    required double amount,
    required Map<String, dynamic> paymentDetails,
  });

  /// Apply promo code
  Future<Either<Failure, Map<String, dynamic>>> applyPromoCode({
    required String promoCode,
    required double subtotal,
  });

  /// Validate shipping address
  Future<Either<Failure, bool>> validateAddress({
    required Map<String, dynamic> address,
  });

  /// Get available shipping methods
  Future<Either<Failure, List<Map<String, dynamic>>>> getShippingMethods({
    required Map<String, dynamic> address,
    required double weight,
  });

  /// Complete checkout and create order
  Future<Either<Failure, Order>> completeCheckout({
    required Checkout checkout,
    required Map<String, dynamic> paymentResult,
  });
}
