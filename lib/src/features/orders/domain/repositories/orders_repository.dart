import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';

/// Orders repository interface
abstract class OrdersRepository {
  /// Create a new order
  Future<Either<Failure, Order>> createOrder({
    required String userId,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> billingAddress,
    required String paymentMethod,
    required String shippingMethod,
    required double totalAmount,
    double? discountAmount,
    String? promoCode,
    String? notes,
  });

  /// Get orders for a specific user
  Future<Either<Failure, List<Order>>> getOrders({
    required String userId,
    int page = 1,
    int limit = 20,
  });

  /// Get a specific order by ID
  Future<Either<Failure, Order>> getOrderById({
    required String userId,
    required int orderId,
  });

  /// Update order status
  Future<Either<Failure, Order>> updateOrderStatus({
    required int orderId,
    required String status,
  });

  /// Cancel an order
  Future<Either<Failure, Unit>> cancelOrder({
    required String userId,
    required int orderId,
  });

  /// Get order history for a user
  Future<Either<Failure, List<Order>>> getOrderHistory({
    required String userId,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
  });
}
