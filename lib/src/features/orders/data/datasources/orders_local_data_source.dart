import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/orders/data/models/order_model.dart';
import 'package:ecommerce/src/features/orders/data/models/order_item_model.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';
import 'package:drift/drift.dart';

/// Local data source for orders
abstract class OrdersLocalDataSource {
  /// Cache an order in local database
  Future<OrderModel> cacheOrder(OrderModel order);

  /// Get orders from local database
  Future<List<OrderModel>> getOrders(
    String userId, {
    int page = 1,
    int limit = 20,
  });

  /// Get a specific order by ID
  Future<OrderModel> getOrderById(String userId, int orderId);

  /// Update order status
  Future<OrderModel> updateOrderStatus(int orderId, String status);

  /// Delete order from local database
  Future<void> deleteOrder(int orderId);

  /// Clear all orders for a user
  Future<void> clearOrders(String userId);
}

/// Implementation of local data source for orders
class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  final AppDatabase database;

  OrdersLocalDataSourceImpl({required this.database});

  @override
  Future<OrderModel> cacheOrder(OrderModel order) async {
    try {
      final orderData = order.toDatabaseRow();

      // Insert or update order
      final orderId = await database
          .into(database.orderTable)
          .insertReturning(
            OrderTableCompanion.insert(
              serverId: Value(orderData['serverId']),
              userId: orderData['userId'],
              status: orderData['status'],
              totalAmount: orderData['totalAmount'],
              discountAmount: Value(orderData['discountAmount']),
              shippingAddress: orderData['shippingAddress'],
              billingAddress: orderData['billingAddress'],
              paymentMethod: orderData['paymentMethod'],
              paymentStatus: orderData['paymentStatus'],
              shippingMethod: orderData['shippingMethod'],
              trackingNumber: Value(orderData['trackingNumber']),
              notes: Value(orderData['notes']),
              createdAt: Value(DateTime.parse(orderData['createdAt'])),
              updatedAt: Value(DateTime.parse(orderData['updatedAt'])),
            ),
          );

      // Insert order items
      for (final item in order.items) {
        final itemModel = item as OrderItemModel;
        final itemData = itemModel.toDatabaseRow();
        itemData['orderId'] = orderId.id;

        await database
            .into(database.orderItemTable)
            .insert(
              OrderItemTableCompanion.insert(
                orderId: orderId.id,
                productId: itemData['productId'],
                productServerId: Value(itemData['productServerId']),
                productName: itemData['productName'],
                productPrice: itemData['productPrice'],
                quantity: itemData['quantity'],
                selectedVariants: Value(itemData['selectedVariants']),
              ),
            );
      }

      return order.copyWith(id: orderId.id);
    } catch (e) {
      throw CacheException('Failed to cache order: ${e.toString()}');
    }
  }

  @override
  Future<List<OrderModel>> getOrders(
    String userId, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final offset = (page - 1) * limit;
      final userIdInt = int.tryParse(userId) ?? 0;

      final ordersQuery = database.select(database.orderTable)
        ..where((order) => order.userId.equals(userIdInt))
        ..orderBy([(order) => OrderingTerm.desc(order.createdAt)])
        ..limit(limit, offset: offset);

      final orderRows = await ordersQuery.get();

      final orders = <OrderModel>[];

      for (final orderRow in orderRows) {
        // Get order items
        final itemsQuery = database.select(database.orderItemTable)
          ..where((item) => item.orderId.equals(orderRow.id));

        final itemRows = await itemsQuery.get();
        final items = <OrderItemModel>[];

        for (final itemRow in itemRows) {
          // Get product details
          final productQuery = database.select(database.productTable)
            ..where(
              (product) => product.id.equals(itemRow.productId.toString()),
            );

          final productRow = await productQuery.getSingleOrNull();

          if (productRow != null) {
            final product = ProductModel.fromDrift(productRow);
            final orderItem = OrderItemModel.fromDatabaseRow({
              'id': itemRow.id,
              'orderId': itemRow.orderId,
              'quantity': itemRow.quantity,
              'productPrice': itemRow.productPrice,
              'selectedVariants': itemRow.selectedVariants,
            }, product);
            items.add(orderItem);
          }
        }

        final order = OrderModel.fromDatabaseRow({
          'id': orderRow.id,
          'serverId': orderRow.serverId,
          'userId': orderRow.userId.toString(),
          'status': orderRow.status,
          'totalAmount': orderRow.totalAmount,
          'discountAmount': orderRow.discountAmount,
          'shippingAddress': orderRow.shippingAddress,
          'billingAddress': orderRow.billingAddress,
          'paymentMethod': orderRow.paymentMethod,
          'paymentStatus': orderRow.paymentStatus,
          'shippingMethod': orderRow.shippingMethod,
          'trackingNumber': orderRow.trackingNumber,
          'notes': orderRow.notes,
          'createdAt': orderRow.createdAt.toIso8601String(),
          'updatedAt': orderRow.updatedAt.toIso8601String(),
        }).copyWith(items: items);
        orders.add(order);
      }

      return orders;
    } catch (e) {
      throw CacheException('Failed to get orders: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> getOrderById(String userId, int orderId) async {
    try {
      final userIdInt = int.tryParse(userId) ?? 0;

      final orderQuery = database.select(database.orderTable)
        ..where(
          (order) => order.id.equals(orderId) & order.userId.equals(userIdInt),
        );

      final orderRow = await orderQuery.getSingleOrNull();

      if (orderRow == null) {
        throw CacheException('Order not found');
      }

      // Get order items
      final itemsQuery = database.select(database.orderItemTable)
        ..where((item) => item.orderId.equals(orderId));

      final itemRows = await itemsQuery.get();
      final items = <OrderItemModel>[];

      for (final itemRow in itemRows) {
        // Get product details
        final productQuery = database.select(database.productTable)
          ..where((product) => product.id.equals(itemRow.productId.toString()));

        final productRow = await productQuery.getSingleOrNull();

        if (productRow != null) {
          final product = ProductModel.fromDrift(productRow);
          final orderItem = OrderItemModel.fromDatabaseRow({
            'id': itemRow.id,
            'orderId': itemRow.orderId,
            'quantity': itemRow.quantity,
            'productPrice': itemRow.productPrice,
            'selectedVariants': itemRow.selectedVariants,
          }, product);
          items.add(orderItem);
        }
      }

      return OrderModel.fromDatabaseRow({
        'id': orderRow.id,
        'serverId': orderRow.serverId,
        'userId': orderRow.userId.toString(),
        'status': orderRow.status,
        'totalAmount': orderRow.totalAmount,
        'discountAmount': orderRow.discountAmount,
        'shippingAddress': orderRow.shippingAddress,
        'billingAddress': orderRow.billingAddress,
        'paymentMethod': orderRow.paymentMethod,
        'paymentStatus': orderRow.paymentStatus,
        'shippingMethod': orderRow.shippingMethod,
        'trackingNumber': orderRow.trackingNumber,
        'notes': orderRow.notes,
        'createdAt': orderRow.createdAt.toIso8601String(),
        'updatedAt': orderRow.updatedAt.toIso8601String(),
      }).copyWith(items: items);
    } catch (e) {
      throw CacheException('Failed to get order: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> updateOrderStatus(int orderId, String status) async {
    try {
      final updateQuery = database.update(database.orderTable)
        ..where((order) => order.id.equals(orderId));

      await updateQuery.write(
        OrderTableCompanion(
          status: Value(status),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // Get the updated order
      final orderQuery = database.select(database.orderTable)
        ..where((order) => order.id.equals(orderId));

      final orderRow = await orderQuery.getSingle();

      return OrderModel.fromDatabaseRow({
        'id': orderRow.id,
        'serverId': orderRow.serverId,
        'userId': orderRow.userId.toString(),
        'status': orderRow.status,
        'totalAmount': orderRow.totalAmount,
        'discountAmount': orderRow.discountAmount,
        'shippingAddress': orderRow.shippingAddress,
        'billingAddress': orderRow.billingAddress,
        'paymentMethod': orderRow.paymentMethod,
        'paymentStatus': orderRow.paymentStatus,
        'shippingMethod': orderRow.shippingMethod,
        'trackingNumber': orderRow.trackingNumber,
        'notes': orderRow.notes,
        'createdAt': orderRow.createdAt.toIso8601String(),
        'updatedAt': orderRow.updatedAt.toIso8601String(),
      });
    } catch (e) {
      throw CacheException('Failed to update order status: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteOrder(int orderId) async {
    try {
      // Delete order items first
      final deleteItemsQuery = database.delete(database.orderItemTable)
        ..where((item) => item.orderId.equals(orderId));

      await deleteItemsQuery.go();

      // Delete order
      final deleteOrderQuery = database.delete(database.orderTable)
        ..where((order) => order.id.equals(orderId));

      await deleteOrderQuery.go();
    } catch (e) {
      throw CacheException('Failed to delete order: ${e.toString()}');
    }
  }

  @override
  Future<void> clearOrders(String userId) async {
    try {
      final userIdInt = int.tryParse(userId) ?? 0;

      // Get all order IDs for the user
      final ordersQuery = database.select(database.orderTable)
        ..where((order) => order.userId.equals(userIdInt));

      final orderRows = await ordersQuery.get();

      for (final orderRow in orderRows) {
        // Delete order items
        final deleteItemsQuery = database.delete(database.orderItemTable)
          ..where((item) => item.orderId.equals(orderRow.id));

        await deleteItemsQuery.go();
      }

      // Delete all orders for the user
      final deleteOrdersQuery = database.delete(database.orderTable)
        ..where((order) => order.userId.equals(userIdInt));

      await deleteOrdersQuery.go();
    } catch (e) {
      throw CacheException('Failed to clear orders: ${e.toString()}');
    }
  }
}
