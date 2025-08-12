import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  RealColumn get price => real()();
  RealColumn get discountPrice => real().nullable()();
  TextColumn get category => text()();
  TextColumn get brand => text().nullable()();
  TextColumn get imageUrl => text()();
  TextColumn get additionalImages => text().nullable()();
  IntColumn get stockQuantity => integer().withDefault(const Constant(0))();
  RealColumn get rating => real().withDefault(const Constant(0.0))();
  IntColumn get reviewCount => integer().withDefault(const Constant(0))();
  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}