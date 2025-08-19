import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart'
    as order_entity;

part 'orders_state.freezed.dart';

/// States for orders bloc
@freezed
sealed class OrdersState with _$OrdersState {
  /// Initial state
  const factory OrdersState.initial() = _Initial;

  /// Loading orders
  const factory OrdersState.loading() = _Loading;

  /// Orders loaded successfully
  const factory OrdersState.loaded({
    required List<order_entity.Order> orders,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = _Loaded;

  /// Loading more orders (pagination)
  const factory OrdersState.loadingMore({
    required List<order_entity.Order> orders,
    @Default(1) int currentPage,
  }) = _LoadingMore;

  /// Order details loaded
  const factory OrdersState.orderDetailsLoaded({
    required order_entity.Order order,
    List<order_entity.Order>? orders,
  }) = _OrderDetailsLoaded;

  /// Order cancelled successfully
  const factory OrdersState.orderCancelled({
    required String orderId,
    required List<order_entity.Order> orders,
  }) = _OrderCancelled;

  /// Error state
  const factory OrdersState.error({
    required String message,
    List<order_entity.Order>? orders,
  }) = _Error;
}
