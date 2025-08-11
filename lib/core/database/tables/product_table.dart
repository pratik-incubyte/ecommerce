import 'package:drift/drift.dart';

/// Product table definition for storing product information
class ProductTable extends Table {
  @override
  String get tableName => 'products';
  
  /// Primary key - product ID
  IntColumn get id => integer().autoIncrement()();
  
  /// Product's unique identifier from the server
  TextColumn get serverId => text().unique().nullable()();
  
  /// Product name
  TextColumn get name => text()();
  
  /// Product description
  TextColumn get description => text().nullable()();
  
  /// Product price
  RealColumn get price => real()();
  
  /// Product discount price (if any)
  RealColumn get discountPrice => real().nullable()();
  
  /// Product category
  TextColumn get category => text()();
  
  /// Product brand
  TextColumn get brand => text().nullable()();
  
  /// Product SKU (Stock Keeping Unit)
  TextColumn get sku => text().unique().nullable()();
  
  /// Product images (JSON array of image URLs)
  TextColumn get images => text().nullable()();
  
  /// Product thumbnail image
  TextColumn get thumbnail => text().nullable()();
  
  /// Available stock quantity
  IntColumn get stock => integer().withDefault(const Constant(0))();
  
  /// Minimum stock level
  IntColumn get minStock => integer().withDefault(const Constant(1))();
  
  /// Product weight (in grams)
  RealColumn get weight => real().nullable()();
  
  /// Product dimensions (JSON object with width, height, depth)
  TextColumn get dimensions => text().nullable()();
  
  /// Product rating (0-5)
  RealColumn get rating => real().withDefault(const Constant(0.0))();
  
  /// Number of reviews
  IntColumn get reviewCount => integer().withDefault(const Constant(0))();
  
  /// Whether product is featured
  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();
  
  /// Whether product is active/available
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  /// Product tags (JSON array)
  TextColumn get tags => text().nullable()();
  
  /// When the product was created
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// When the product was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
