import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/order_table.dart';
import '../tables/product_table.dart';

part 'order_dao.g.dart';

class OrderWithItems {
  final Order order;
  final List<OrderItemWithProduct> items;

  OrderWithItems({
    required this.order,
    required this.items,
  });
}

class OrderItemWithProduct {
  final OrderItem orderItem;
  final Product product;

  OrderItemWithProduct({
    required this.orderItem,
    required this.product,
  });
}

@DriftAccessor(tables: [Orders, OrderItems, Products])
class OrderDao extends DatabaseAccessor<AppDatabase> with _$OrderDaoMixin {
  OrderDao(AppDatabase db) : super(db);

  Future<List<Order>> getUserOrders(String userId) {
    return (select(orders)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  Stream<List<Order>> watchUserOrders(String userId) {
    return (select(orders)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<Order?> getOrderById(String orderId) {
    return (select(orders)..where((tbl) => tbl.orderId.equals(orderId)))
        .getSingleOrNull();
  }

  Future<OrderWithItems?> getOrderWithItems(String orderId) async {
    final order = await getOrderById(orderId);
    if (order == null) return null;

    final itemsQuery = select(orderItems).join([
      innerJoin(
        products,
        products.productId.equalsExp(orderItems.productId),
      ),
    ])
      ..where(orderItems.orderId.equals(orderId));

    final itemsResult = await itemsQuery.get();
    final items = itemsResult.map((row) {
      return OrderItemWithProduct(
        orderItem: row.readTable(orderItems),
        product: row.readTable(products),
      );
    }).toList();

    return OrderWithItems(order: order, items: items);
  }

  Future<int> createOrder(OrdersCompanion order) {
    return into(orders).insert(order);
  }

  Future<void> createOrderItems(List<OrderItemsCompanion> items) {
    return batch((batch) {
      batch.insertAll(orderItems, items);
    });
  }

  Future<int> updateOrderStatus(String orderId, String status) {
    return (update(orders)..where((tbl) => tbl.orderId.equals(orderId)))
        .write(OrdersCompanion(
      status: Value(status),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> updatePaymentStatus(String orderId, String paymentStatus) {
    return (update(orders)..where((tbl) => tbl.orderId.equals(orderId)))
        .write(OrdersCompanion(
      paymentStatus: Value(paymentStatus),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> updateTrackingNumber(String orderId, String trackingNumber) {
    return (update(orders)..where((tbl) => tbl.orderId.equals(orderId)))
        .write(OrdersCompanion(
      trackingNumber: Value(trackingNumber),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<List<Order>> getOrdersByStatus(String status) {
    return (select(orders)
          ..where((tbl) => tbl.status.equals(status))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  Future<List<Order>> getRecentOrders(String userId, {int limit = 5}) {
    return (select(orders)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(limit))
        .get();
  }

  Future<double> getUserTotalSpent(String userId) async {
    final sumExp = orders.totalAmount.sum();
    final query = selectOnly(orders)
      ..addColumns([sumExp])
      ..where(orders.userId.equals(userId) &
          orders.paymentStatus.equals('completed'));

    final result = await query.getSingle();
    return result.read(sumExp) ?? 0.0;
  }

  Future<int> getUserOrderCount(String userId) async {
    final countExp = orders.id.count();
    final query = selectOnly(orders)
      ..addColumns([countExp])
      ..where(orders.userId.equals(userId));

    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Future<List<OrderItemWithProduct>> getOrderItems(String orderId) async {
    final query = select(orderItems).join([
      innerJoin(
        products,
        products.productId.equalsExp(orderItems.productId),
      ),
    ])
      ..where(orderItems.orderId.equals(orderId));

    final result = await query.get();
    return result.map((row) {
      return OrderItemWithProduct(
        orderItem: row.readTable(orderItems),
        product: row.readTable(products),
      );
    }).toList();
  }

  Future<int> cancelOrder(String orderId) {
    return updateOrderStatus(orderId, 'cancelled');
  }
}