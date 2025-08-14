import 'dart:convert';

// ignore_for_file: avoid_redundant_argument_values
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_local_data_source.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final bool hasSqlite = (() {
    try {
      sqlite3.sqlite3.openInMemory().dispose();
      return true;
    } catch (_) {
      return false;
    }
  })();
  late AppDatabase db;
  late ProductsLocalDataSource local;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    local = ProductsLocalDataSourceImpl(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('cache and get products', () {
    test('should insert and read back product rows', () async {
      final list = (jsonDecode(fixture('products.json')) as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

      await local.cacheProducts(list);
      final rows = await local.getProducts();

      expect(rows.length, list.length);
      expect(rows.first.id, list.first.id);
    }, skip: !hasSqlite);

    test('should insert single product and fetch by id', () async {
      final map = jsonDecode(fixture('product.json')) as Map<String, dynamic>;
      final model = ProductModel.fromJson(map);

      await local.cacheProduct(model);
      final fetched = await local.getProduct(model.id);

      expect(fetched.id, model.id);
      expect(fetched.title, model.title);
    }, skip: !hasSqlite);

    test('should throw CacheException when product not found', () async {
      expect(() => local.getProduct(999), throwsA(isA<CacheException>()));
    }, skip: !hasSqlite);
  });
}
