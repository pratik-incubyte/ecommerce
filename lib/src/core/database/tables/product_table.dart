import 'package:drift/drift.dart';

/// Product table definition for storing product information
class ProductTable extends Table {
  @override
  String get tableName => 'products';

  /// Product's unique identifier from the server
  TextColumn get id => text().unique().nullable()();

  /// Product name
  TextColumn get name => text()();

  /// Product description
  TextColumn get description => text().nullable()();

  /// Product price
  RealColumn get price => real()();

  /// Product brand
  TextColumn get brand => text().nullable()();

  /// Product SKU (Stock Keeping Unit)
  TextColumn get sku => text().unique().nullable()();

  /// Product images (JSON array of image URLs)
  TextColumn get images => text().nullable()();
}
