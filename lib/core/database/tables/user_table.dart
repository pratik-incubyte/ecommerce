import 'package:drift/drift.dart';

/// User table definition for storing user information
class UserTable extends Table {
  @override
  String get tableName => 'users';
  
  /// Primary key - user ID
  IntColumn get id => integer().autoIncrement()();
  
  /// User's unique identifier from the server
  TextColumn get serverId => text().unique().nullable()();
  
  /// User's email address
  TextColumn get email => text().unique()();
  
  /// User's first name
  TextColumn get firstName => text()();
  
  /// User's last name
  TextColumn get lastName => text()();
  
  /// User's phone number
  TextColumn get phone => text().nullable()();
  
  /// User's profile picture URL
  TextColumn get profilePicture => text().nullable()();
  
  /// User's address
  TextColumn get address => text().nullable()();
  
  /// User's city
  TextColumn get city => text().nullable()();
  
  /// User's country
  TextColumn get country => text().nullable()();
  
  /// User's postal code
  TextColumn get postalCode => text().nullable()();
  
  /// Whether user is verified
  BoolColumn get isVerified => boolean().withDefault(const Constant(false))();
  
  /// Whether user account is active
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  /// When the user was created
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// When the user was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
