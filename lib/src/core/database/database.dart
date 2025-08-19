import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

// Import all table files
import 'tables/user_table.dart';
import 'tables/product_table.dart';
import 'tables/cart_table.dart';
import 'tables/order_table.dart';

part 'database.g.dart';

/// Main database class for the ecommerce application
@DriftDatabase(
  tables: [UserTable, ProductTable, CartTable, OrderTable, OrderItemTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  // Test-only constructor for in-memory databases
  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1 && to == 2) {
          // Migrate from integer userId to text userId
          await m.database.customStatement('ALTER TABLE orders RENAME TO orders_old');
          await m.createTable(orderTable);
          
          // Copy data with userId converted to text
          await m.database.customStatement('''
            INSERT INTO orders (id, serverId, userId, status, totalAmount, discountAmount,
                               shippingAddress, billingAddress, paymentMethod, paymentStatus,
                               shippingMethod, trackingNumber, notes, createdAt, updatedAt)
            SELECT id, serverId, CAST(userId AS TEXT), status, totalAmount, discountAmount,
                   shippingAddress, billingAddress, paymentMethod, paymentStatus,
                   shippingMethod, trackingNumber, notes, createdAt, updatedAt
            FROM orders_old
          ''');
          
          // Drop old table
          await m.database.customStatement('DROP TABLE orders_old');
        }
      },
    );
  }
}

/// Opens a connection to the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ecommerce.db'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
