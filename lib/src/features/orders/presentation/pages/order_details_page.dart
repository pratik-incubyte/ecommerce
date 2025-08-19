import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/orders_bloc.dart';
import '../../domain/entities/order.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class OrderDetailsPage extends StatefulWidget {
  final String orderId;
  final String? userId;

  const OrderDetailsPage({super.key, required this.orderId, this.userId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OrdersBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, authState) {
          // When auth state changes and we have a user, load order details
          authState.whenOrNull(
            authenticated: (user) {
              context.read<OrdersBloc>().add(
                OrdersEvent.getOrderDetails(
                  userId: user.id,
                  orderId: widget.orderId,
                ),
              );
            },
          );
        },
        builder: (context, authState) {
          return authState.when(
            initial: () {
              // Trigger auth check if not already done
              context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            },
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            authenticated: (user) {
              // User is authenticated, show the order details
              return OrderDetailsView(
                orderId: widget.orderId, 
                userId: widget.userId ?? user.id,
              );
            },
            unauthenticated: () {
              // User not authenticated, handle accordingly
              return Scaffold(
                appBar: AppBar(title: const Text('Unauthorized')),
                body: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 64),
                      SizedBox(height: 16),
                      Text(
                        'You need to be logged in to view order details',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (message) {
              return Scaffold(
                appBar: AppBar(title: const Text('Error')),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 64),
                      SizedBox(height: 16),
                      Text('Authentication error: $message'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  
  /// Get authenticated user ID with fallback
  String _getUserId(BuildContext context) {
    // First try to use the passed userId
    if (widget.userId != null && widget.userId!.isNotEmpty && widget.userId != '1') {
      return widget.userId!;
    }
    
    // Then try to get from AuthBloc if available
    try {
      final authBloc = getIt<AuthBloc>();
      final authState = authBloc.state;
      final authenticatedUserId = authState.whenOrNull(
        authenticated: (user) => user.id,
      );
      if (authenticatedUserId != null) {
        return authenticatedUserId;
      }
    } catch (e) {
      // AuthBloc might not be available in this context
    }
    
    return widget.userId ?? '1'; // Final fallback for demo
  }
}

class OrderDetailsView extends StatefulWidget {
  final String orderId;
  final String? userId;

  const OrderDetailsView({super.key, required this.orderId, this.userId});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  void initState() {
    super.initState();
    // Load order details when the view is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final actualUserId = _getUserId(context);
      context.read<OrdersBloc>().add(
        OrdersEvent.getOrderDetails(
          userId: actualUserId,
          orderId: widget.orderId,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.orderId}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBackNavigation(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final actualUserId = _getUserId(context);
              context.read<OrdersBloc>().add(
                OrdersEvent.getOrderDetails(
                  userId: actualUserId,
                  orderId: widget.orderId,
                ),
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
            loaded: (orders, hasReachedMax, currentPage) {
              // Find the specific order from the loaded orders
              final order = orders.firstWhere(
                (o) => o.id == widget.orderId,
                orElse: () => throw Exception('Order not found'),
              );
              return _buildOrderDetails(context, order);
            },
            loadingMore: (orders, currentPage) {
              final order = orders.firstWhere(
                (o) => o.id == widget.orderId,
                orElse: () => throw Exception('Order not found'),
              );
              return _buildOrderDetails(context, order);
            },
            orderDetailsLoaded: (order, orders) =>
                _buildOrderDetails(context, order),
            orderCancelled: (orderId, orders) {
              final order = orders.firstWhere(
                (o) => o.id == widget.orderId,
                orElse: () => throw Exception('Order not found'),
              );
              return _buildOrderDetails(context, order);
            },
            error: (message, orders) => orders != null && orders.isNotEmpty
                ? _buildOrderDetails(
                    context,
                    orders.firstWhere(
                      (o) => o.id == widget.orderId,
                      orElse: () => throw Exception('Order not found'),
                    ),
                  )
                : _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context, Order order) {
    return RefreshIndicator(
      onRefresh: () async {
        final actualUserId = _getUserId(context);
        context.read<OrdersBloc>().add(
          OrdersEvent.getOrderDetails(
            userId: actualUserId,
            orderId: widget.orderId,
          ),
        );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status Card
            _buildStatusCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Order Information Card
            _buildOrderInfoCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Shipping Information Card
            _buildShippingInfoCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Payment Information Card
            _buildPaymentInfoCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Order Items Card
            _buildOrderItemsCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Order Summary Card
            _buildOrderSummaryCard(order),
            const SizedBox(height: AppConstants.defaultPadding),

            // Actions
            if (order.isPending || order.status.toLowerCase() == 'processing')
              _buildActionButtons(context, order),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(Order order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusChip(order.status),
                Text(
                  'Order #${order.id}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Builder(
              builder: (context) => Text(
                'Placed on ${_formatDate(order.createdAt)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            if (order.trackingNumber != null) ...[
              const SizedBox(height: AppConstants.smallPadding),
              Row(
                children: [
                  const Text(
                    'Tracking Number: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(order.trackingNumber!),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoCard(Order order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoRow('Total Items', '${order.totalItems}'),
            _buildInfoRow(
              'Total Amount',
              '\$${order.totalAmount.toStringAsFixed(2)}',
            ),
            if (order.discountAmount != null && order.discountAmount! > 0)
              _buildInfoRow(
                'Discount',
                '-\$${order.discountAmount!.toStringAsFixed(2)}',
              ),
            _buildInfoRow(
              'Final Amount',
              '\$${order.finalAmount.toStringAsFixed(2)}',
            ),
            if (order.notes != null && order.notes!.isNotEmpty) ...[
              const SizedBox(height: AppConstants.smallPadding),
              const Text(
                'Notes:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(order.notes!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfoCard(Order order) {
    final shippingAddress = order.shippingAddress;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shipping Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoRow('Method', order.shippingMethod),
            const SizedBox(height: AppConstants.smallPadding),
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            _buildAddressText(shippingAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInfoCard(Order order) {
    final billingAddress = order.billingAddress;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildInfoRow('Payment Method', order.paymentMethod),
            _buildInfoRow('Payment Status', order.paymentStatus),
            const SizedBox(height: AppConstants.smallPadding),
            const Text(
              'Billing Address:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            _buildAddressText(billingAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItemsCard(Order order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ...order.items.map((item) => _buildOrderItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(dynamic item) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      padding: const EdgeInsets.all(AppConstants.smallPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Product image placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          const SizedBox(width: AppConstants.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Quantity: ${item.quantity}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Price: \$${item.productPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            '\$${item.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryCard(Order order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildSummaryRow(
              'Subtotal',
              '\$${order.subtotal.toStringAsFixed(2)}',
            ),
            if (order.discountAmount != null && order.discountAmount! > 0)
              _buildSummaryRow(
                'Discount',
                '-\$${order.discountAmount!.toStringAsFixed(2)}',
                isDiscount: true,
              ),
            const Divider(),
            _buildSummaryRow(
              'Total',
              '\$${order.totalAmount.toStringAsFixed(2)}',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Order order) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _cancelOrder(context, order),
            icon: const Icon(Icons.cancel),
            label: const Text('Cancel Order'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact support feature coming soon!'),
                ),
              );
            },
            icon: const Icon(Icons.support_agent),
            label: const Text('Contact Support'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    bool isDiscount = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
              color: isDiscount ? Colors.green : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressText(Map<String, dynamic> address) {
    return Text(
      '${address['firstName'] ?? ''} ${address['lastName'] ?? ''}\n'
      '${address['addressLine1'] ?? ''}\n'
      '${address['addressLine2'] ?? ''}\n'
      '${address['city'] ?? ''}, ${address['state'] ?? ''} ${address['postalCode'] ?? ''}\n'
      '${address['country'] ?? ''}',
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
            const Text(
              'Error loading order details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final actualUserId = _getUserId(context);
                context.read<OrdersBloc>().add(
                  OrdersEvent.getOrderDetails(
                    userId: actualUserId,
                    orderId: widget.orderId,
                  ),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
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
              final actualUserId = _getUserId(context);
              context.read<OrdersBloc>().add(
                OrdersEvent.cancelOrder(
                  userId: actualUserId,
                  orderId: order.id!,
                ),
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

  /// Get authenticated user ID with fallback
  String _getUserId(BuildContext context) {
    // First try to use the passed userId
    if (widget.userId != null && widget.userId!.isNotEmpty && widget.userId != '1') {
      return widget.userId!;
    }
    
    // Then try to get from AuthBloc
    final authState = context.read<AuthBloc>().state;
    return authState.whenOrNull(
      authenticated: (user) => user.id,
    ) ?? widget.userId ?? '1'; // Final fallback for demo
  }

  /// Handle back navigation with smart routing
  void _handleBackNavigation(BuildContext context) {
    // Check if we can go back in the navigation stack
    if (Navigator.of(context).canPop()) {
      // If there's a previous route in the stack, go back normally
      Navigator.of(context).pop();
    } else {
      // If this was opened via deep link or there's no back stack,
      // navigate to the orders page
      context.goNamed('orders');
    }
  }
}
