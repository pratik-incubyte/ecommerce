import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/user_table.dart';
import 'tables/product_table.dart';
import 'tables/cart_table.dart';
import 'tables/order_table.dart';
import 'daos/user_dao.dart';
import 'daos/product_dao.dart';
import 'daos/cart_dao.dart';
import 'daos/order_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    UserAddresses,
    Products,
    CartItems,
    Orders,
    OrderItems,
  ],
  daos: [
    UserDao,
    ProductDao,
    CartDao,
    OrderDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations here
      },
    );
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ecommerce.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}