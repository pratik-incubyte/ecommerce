import 'package:drift/drift.dart';
import 'product_table.dart';
import 'user_table.dart';

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(Users, #uid)();
  TextColumn get productId => text().references(Products, #productId)();
  IntColumn get quantity => integer()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
}