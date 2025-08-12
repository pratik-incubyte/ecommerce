import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text().unique()();
  TextColumn get email => text()();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get photoUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class UserAddresses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(Users, #uid)();
  TextColumn get addressLine1 => text()();
  TextColumn get addressLine2 => text().nullable()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get zipCode => text()();
  TextColumn get country => text()();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}