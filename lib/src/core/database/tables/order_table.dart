import 'package:drift/drift.dart';

/// Order table definition for storing order information
class OrderTable extends Table {
  @override
  String get tableName => 'orders';
  
  /// Primary key - order ID
  IntColumn get id => integer().autoIncrement()();
  
  /// Order's unique identifier from the server
  TextColumn get serverId => text().unique().nullable()();
  
  /// User ID (foreign key to users table)
  IntColumn get userId => integer()();
  
  /// Order status (e.g. pending, completed, cancelled)
  TextColumn get status => text()();
  
  /// Order total amount
  RealColumn get totalAmount => real()();
  
  /// Order discount amount
  RealColumn get discountAmount => real().nullable()();
  
  /// Shipping address (JSON object)
  TextColumn get shippingAddress => text()();
  
  /// Billing address (JSON object)
  TextColumn get billingAddress => text()();
  
  /// Payment method used
  TextColumn get paymentMethod => text()();
  
  /// Payment status (e.g. paid, unpaid)
  TextColumn get paymentStatus => text()();
  
  /// Shipping method
  TextColumn get shippingMethod => text()();
  
  /// Tracking number
  TextColumn get trackingNumber => text().nullable()();
  
  /// Order notes
  TextColumn get notes => text().nullable()();
  
  /// When the order was created
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// When the order was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Order items table definition for storing individual items in an order
class OrderItemTable extends Table {
  @override
  String get tableName => 'order_items';
  
  /// Primary key - order item ID
  IntColumn get id => integer().autoIncrement()();
  
  /// Order ID (foreign key to orders table)
  IntColumn get orderId => integer()();
  
  /// Product ID (foreign key to products table)
  IntColumn get productId => integer()();
  
  /// Product's server ID
  TextColumn get productServerId => text().nullable()();
  
  /// Product name (cached)
  TextColumn get productName => text()();
  
  /// Product price at the time of order
  RealColumn get productPrice => real()();
  
  /// Quantity of the product ordered
  IntColumn get quantity => integer()();
  
  /// Selected variants (JSON object)
  TextColumn get selectedVariants => text().nullable()();
  
}
