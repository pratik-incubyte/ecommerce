import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_event.freezed.dart';

/// Events for orders bloc
@freezed
sealed class OrdersEvent with _$OrdersEvent {
  /// Get orders for a user
  const factory OrdersEvent.getOrders({
    required String userId,
    @Default(1) int page,
    @Default(20) int limit,
  }) = _GetOrders;

  /// Get order details by ID
  const factory OrdersEvent.getOrderDetails({
    required String userId,
    required int orderId,
  }) = _GetOrderDetails;

  /// Cancel an order
  const factory OrdersEvent.cancelOrder({
    required String userId,
    required int orderId,
  }) = _CancelOrder;

  /// Refresh orders list
  const factory OrdersEvent.refreshOrders({required String userId}) =
      _RefreshOrders;

  /// Load more orders (pagination)
  const factory OrdersEvent.loadMoreOrders({
    required String userId,
    required int page,
  }) = _LoadMoreOrders;
}
