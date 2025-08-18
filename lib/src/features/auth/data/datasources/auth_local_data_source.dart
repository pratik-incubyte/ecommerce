import 'package:drift/drift.dart';
import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Cache user data locally
  Future<void> cacheUser(UserModel user);

  /// Get cached user data
  Future<UserModel?> getCachedUser();

  /// Clear cached user data
  Future<void> clearCachedUser();

  /// Check if user data is cached
  Future<bool> isUserCached();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppDatabase database;

  AuthLocalDataSourceImpl({required this.database});

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      // Check if user already exists by email
      final existingUser = await (database.select(
        database.userTable,
      )..where((tbl) => tbl.email.equals(user.email))).getSingleOrNull();

      if (existingUser != null) {
        // Update existing user
        await (database.update(
          database.userTable,
        )..where((tbl) => tbl.email.equals(user.email))).write(
          UserTableCompanion(
            serverId: Value(user.id),
            firstName: Value(user.firstName),
            lastName: Value(user.lastName),
            phone: Value(user.phone),
            profilePicture: Value(user.profilePicture),
            address: Value(user.address),
            city: Value(user.city),
            country: Value(user.country),
            postalCode: Value(user.postalCode),
            isVerified: Value(user.isVerified),
            isActive: Value(user.isActive),
            updatedAt: Value(user.updatedAt),
          ),
        );
      } else {
        // Insert new user
        await database
            .into(database.userTable)
            .insert(
              UserTableCompanion.insert(
                serverId: Value(user.id),
                email: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                phone: Value(user.phone),
                profilePicture: Value(user.profilePicture),
                address: Value(user.address),
                city: Value(user.city),
                country: Value(user.country),
                postalCode: Value(user.postalCode),
                isVerified: Value(user.isVerified),
                isActive: Value(user.isActive),
                createdAt: Value(user.createdAt),
                updatedAt: Value(user.updatedAt),
              ),
            );
      }
    } catch (e) {
      throw CacheException('Failed to cache user: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final query = database.select(database.userTable)
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
        ..limit(1);

      final users = await query.get();

      if (users.isEmpty) return null;

      return _userTableDataToModel(users.first);
    } catch (e) {
      throw CacheException('Failed to get cached user: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCachedUser() async {
    try {
      await database.delete(database.userTable).go();
    } catch (e) {
      throw CacheException('Failed to clear cached user: ${e.toString()}');
    }
  }

  @override
  Future<bool> isUserCached() async {
    try {
      final count = database.selectOnly(database.userTable)
        ..addColumns([database.userTable.id.count()]);
      final result = await count.getSingle();
      return (result.read(database.userTable.id.count()) ?? 0) > 0;
    } catch (e) {
      throw CacheException(
        'Failed to check if user is cached: ${e.toString()}',
      );
    }
  }

  /// Convert UserTableData to UserModel
  UserModel _userTableDataToModel(UserTableData data) {
    return UserModel(
      id: data.serverId ?? '',
      email: data.email,
      firstName: data.firstName,
      lastName: data.lastName,
      phone: data.phone,
      profilePicture: data.profilePicture,
      address: data.address,
      city: data.city,
      country: data.country,
      postalCode: data.postalCode,
      isVerified: data.isVerified,
      isActive: data.isActive,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }
}
