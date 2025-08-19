import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:ecommerce/src/features/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:ecommerce/src/features/orders/domain/usecases/cancel_order_usecase.dart';
import 'orders_event.dart';
import 'orders_state.dart';

export 'orders_event.dart';
export 'orders_state.dart';

/// BLoC for managing orders
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  OrdersBloc({
    required this.getOrdersUseCase,
    required this.getOrderDetailsUseCase,
    required this.cancelOrderUseCase,
  }) : super(const OrdersState.initial()) {
    on<OrdersEvent>((event, emit) async {
      await event.when(
        getOrders: (userId, page, limit) =>
            _onGetOrders(userId, page, limit, emit),
        getOrderDetails: (userId, orderId) =>
            _onGetOrderDetails(userId, orderId, emit),
        cancelOrder: (userId, orderId) => _onCancelOrder(userId, orderId, emit),
        refreshOrders: (userId) => _onRefreshOrders(userId, emit),
        loadMoreOrders: (userId, page) => _onLoadMoreOrders(userId, page, emit),
      );
    });
  }

  Future<void> _onGetOrders(
    String userId,
    int page,
    int limit,
    Emitter<OrdersState> emit,
  ) async {
    emit(const OrdersState.loading());

    final result = await getOrdersUseCase(
      GetOrdersParams(userId: userId, page: page, limit: limit),
    );

    result.fold(
      (failure) => emit(OrdersState.error(message: failure.message)),
      (orders) => emit(
        OrdersState.loaded(
          orders: orders,
          currentPage: page,
          hasReachedMax: orders.length < limit,
        ),
      ),
    );
  }

  Future<void> _onGetOrderDetails(
    String userId,
    String orderId,
    Emitter<OrdersState> emit,
  ) async {
    final currentState = state;
    final currentOrders = currentState.whenOrNull(
      loaded: (orders, _, __) => orders,
      orderDetailsLoaded: (_, orders) => orders,
      orderCancelled: (_, orders) => orders,
      error: (_, orders) => orders,
    );

    final result = await getOrderDetailsUseCase(
      GetOrderDetailsParams(userId: userId, orderId: orderId),
    );

    result.fold(
      (failure) => emit(
        OrdersState.error(message: failure.message, orders: currentOrders),
      ),
      (order) => emit(
        OrdersState.orderDetailsLoaded(order: order, orders: currentOrders),
      ),
    );
  }

  Future<void> _onCancelOrder(
    String userId,
    String orderId,
    Emitter<OrdersState> emit,
  ) async {
    final currentState = state;
    final currentOrders = currentState.whenOrNull(
      loaded: (orders, _, __) => orders,
      orderDetailsLoaded: (_, orders) => orders,
      orderCancelled: (_, orders) => orders,
      error: (_, orders) => orders,
    );

    if (currentOrders == null) {
      emit(const OrdersState.error(message: 'No orders available'));
      return;
    }

    final result = await cancelOrderUseCase(
      CancelOrderParams(userId: userId, orderId: orderId),
    );

    result.fold(
      (failure) => emit(
        OrdersState.error(message: failure.message, orders: currentOrders),
      ),
      (_) {
        // Update the orders list to reflect the cancelled order
        final updatedOrders = currentOrders.map((order) {
          if (order.id == orderId) {
            return order.copyWith(status: 'cancelled');
          }
          return order;
        }).toList();

        emit(
          OrdersState.orderCancelled(orderId: orderId, orders: updatedOrders),
        );
      },
    );
  }

  Future<void> _onRefreshOrders(
    String userId,
    Emitter<OrdersState> emit,
  ) async {
    // Reset to first page and reload
    await _onGetOrders(userId, 1, 20, emit);
  }

  Future<void> _onLoadMoreOrders(
    String userId,
    int page,
    Emitter<OrdersState> emit,
  ) async {
    final currentState = state;
    final currentOrders = currentState.whenOrNull(
      loaded: (orders, _, __) => orders,
    );

    if (currentOrders == null) {
      emit(const OrdersState.error(message: 'No current orders to load more'));
      return;
    }

    // Show loading more state
    emit(OrdersState.loadingMore(orders: currentOrders, currentPage: page - 1));

    final result = await getOrdersUseCase(
      GetOrdersParams(userId: userId, page: page, limit: 20),
    );

    result.fold(
      (failure) => emit(
        OrdersState.error(message: failure.message, orders: currentOrders),
      ),
      (newOrders) {
        final allOrders = [...currentOrders, ...newOrders];
        emit(
          OrdersState.loaded(
            orders: allOrders,
            currentPage: page,
            hasReachedMax: newOrders.length < 20,
          ),
        );
      },
    );
  }
}
