import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/src/core/di/injection_container.dart';
import 'package:ecommerce/src/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/constants/app_constants.dart';

class OrdersPage extends StatefulWidget {
  final String? userId;

  const OrdersPage({super.key, this.userId});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final userId = authState.maybeWhen(
          authenticated: (user) => user.id,
          orElse: () => widget.userId ?? 'user123', // Fallback for development
        );

        return BlocProvider(
          create: (context) =>
              getIt<OrdersBloc>()..add(OrdersEvent.getOrders(userId: userId)),
          child: _OrdersView(userId: userId),
        );
      },
    );
  }
}

class _OrdersView extends StatelessWidget {
  final String userId;

  const _OrdersView({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<OrdersBloc>().add(
                OrdersEvent.refreshOrders(userId: userId),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          state.whenOrNull(
            orderCancelled: (orderId, orders) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order #$orderId has been cancelled'),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              );
            },
            error: (message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (orders, hasReachedMax, currentPage) =>
                _buildOrdersList(context, orders, hasReachedMax, currentPage),
            loadingMore: (orders, currentPage) => _buildOrdersList(
              context,
              orders,
              false,
              currentPage,
              isLoadingMore: true,
            ),
            orderDetailsLoaded: (order, orders) =>
                _buildOrdersList(context, orders ?? [], false, 1),
            orderCancelled: (orderId, orders) =>
                _buildOrdersList(context, orders, false, 1),
            error: (message, orders) => orders != null && orders.isNotEmpty
                ? _buildOrdersList(context, orders, false, 1)
                : _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  Widget _buildOrdersList(
    BuildContext context,
    List<Order> orders,
    bool hasReachedMax,
    int currentPage, {
    bool isLoadingMore = false,
  }) {
    if (orders.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<OrdersBloc>().add(
          OrdersEvent.refreshOrders(userId: userId),
        );
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length + (isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= orders.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final order = orders[index];
          return _buildOrderCard(context, order);
        },
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, Order order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildStatusChip(order.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Placed on ${_formatDate(order.createdAt)}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${order.totalItems} items • \$${order.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _navigateToOrderDetails(context, order),
                  child: const Text('View Details'),
                ),
                if (order.isPending ||
                    order.status.toLowerCase() == 'processing')
                  TextButton(
                    onPressed: () => _cancelOrder(context, order),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                    child: const Text('Cancel'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Builder(
      builder: (context) {
        Color chipColor;
        Color textColor;

        switch (status.toLowerCase()) {
          case 'pending':
            chipColor = Theme.of(
              context,
            ).colorScheme.secondary.withOpacity(0.2);
            textColor = Theme.of(context).colorScheme.secondary;
            break;
          case 'processing':
            chipColor = Theme.of(context).colorScheme.primary.withOpacity(0.2);
            textColor = Theme.of(context).colorScheme.primary;
            break;
          case 'shipped':
            chipColor = Theme.of(context).colorScheme.tertiary.withOpacity(0.2);
            textColor = Theme.of(context).colorScheme.tertiary;
            break;
          case 'delivered':
          case 'completed':
            chipColor = Theme.of(context).colorScheme.primaryContainer;
            textColor = Theme.of(context).colorScheme.onPrimaryContainer;
            break;
          case 'cancelled':
            chipColor = Theme.of(context).colorScheme.errorContainer;
            textColor = Theme.of(context).colorScheme.onErrorContainer;
            break;
          default:
            chipColor = Theme.of(context).colorScheme.surfaceVariant;
            textColor = Theme.of(context).colorScheme.onSurfaceVariant;
        }

        return Chip(
          label: Text(
            status.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: chipColor,
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No orders yet',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'When you place an order, it will appear here',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading orders',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<OrdersBloc>().add(
                  OrdersEvent.refreshOrders(userId: userId),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToOrderDetails(BuildContext context, Order order) {
    GoRouter.of(context).goNamed(
      'order-details',
      pathParameters: {'orderId': order.id.toString()},
      queryParameters: {'userId': userId},
    );
  }

  void _cancelOrder(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Order'),
        content: Text('Are you sure you want to cancel order #${order.id}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<OrdersBloc>().add(
                OrdersEvent.cancelOrder(userId: userId, orderId: order.id!),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
