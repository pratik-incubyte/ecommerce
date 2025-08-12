import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users, UserAddresses])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<User?> getUserByUid(String uid) {
    return (select(users)..where((tbl) => tbl.uid.equals(uid)))
        .getSingleOrNull();
  }

  Future<User?> getUserByEmail(String email) {
    return (select(users)..where((tbl) => tbl.email.equals(email)))
        .getSingleOrNull();
  }

  Future<int> insertUser(UsersCompanion user) {
    return into(users).insert(user);
  }

  Future<bool> updateUser(UsersCompanion user) {
    return update(users).replace(user);
  }

  Future<int> deleteUser(String uid) {
    return (delete(users)..where((tbl) => tbl.uid.equals(uid))).go();
  }

  Stream<User?> watchUser(String uid) {
    return (select(users)..where((tbl) => tbl.uid.equals(uid)))
        .watchSingleOrNull();
  }

  Future<List<UserAddressesData>> getUserAddresses(String userId) {
    return (select(userAddresses)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.isDefault)]))
        .get();
  }

  Future<UserAddressesData?> getDefaultAddress(String userId) {
    return (select(userAddresses)
          ..where((tbl) => tbl.userId.equals(userId) & tbl.isDefault.equals(true)))
        .getSingleOrNull();
  }

  Future<int> insertAddress(UserAddressesCompanion address) {
    return into(userAddresses).insert(address);
  }

  Future<bool> updateAddress(UserAddressesCompanion address) {
    return update(userAddresses).replace(address);
  }

  Future<int> deleteAddress(int id) {
    return (delete(userAddresses)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> setDefaultAddress(String userId, int addressId) async {
    await transaction(() async {
      await (update(userAddresses)
            ..where((tbl) => tbl.userId.equals(userId)))
          .write(const UserAddressesCompanion(isDefault: Value(false)));
      
      await (update(userAddresses)
            ..where((tbl) => tbl.id.equals(addressId)))
          .write(const UserAddressesCompanion(isDefault: Value(true)));
    });
  }
}