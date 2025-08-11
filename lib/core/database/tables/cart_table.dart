import 'package:drift/drift.dart';

/// Cart table definition for storing cart items
class CartTable extends Table {
  @override
  String get tableName => 'cart_items';
  
  /// Primary key - cart item ID
  IntColumn get id => integer().autoIncrement()();
  
  /// User ID (foreign key to users table)
  IntColumn get userId => integer()();
  
  /// Product ID (foreign key to products table)
  IntColumn get productId => integer()();
  
  /// Product's server ID
  TextColumn get productServerId => text().nullable()();
  
  /// Product name (cached for offline access)
  TextColumn get productName => text()();
  
  /// Product price at the time of adding to cart
  RealColumn get productPrice => real()();
  
  /// Product discount price at the time of adding to cart
  RealColumn get productDiscountPrice => real().nullable()();
  
  /// Product thumbnail (cached for offline access)
  TextColumn get productThumbnail => text().nullable()();
  
  /// Quantity of the product in cart
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  
  /// Selected variant options (JSON object)
  TextColumn get selectedVariants => text().nullable()();
  
  /// When the item was added to cart
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// When the cart item was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
}
