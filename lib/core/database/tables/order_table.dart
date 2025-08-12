import 'package:drift/drift.dart';
import 'user_table.dart';
import 'product_table.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderId => text().unique()();
  TextColumn get userId => text().references(Users, #uid)();
  RealColumn get totalAmount => real()();
  RealColumn get discountAmount => real().withDefault(const Constant(0))();
  RealColumn get taxAmount => real().withDefault(const Constant(0))();
  RealColumn get shippingAmount => real().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  TextColumn get paymentMethod => text()();
  TextColumn get paymentStatus => text().withDefault(const Constant('pending'))();
  TextColumn get shippingAddressJson => text()();
  TextColumn get billingAddressJson => text().nullable()();
  TextColumn get trackingNumber => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderId => text().references(Orders, #orderId)();
  TextColumn get productId => text().references(Products, #productId)();
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
  RealColumn get discount => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}