import 'package:drift/drift.dart';
import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

abstract class ProductsLocalDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getProduct(int id);

  Future<void> cacheProducts(List<Product> products);

  Future<void> cacheProduct(Product product);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final AppDatabase database;
  ProductsLocalDataSourceImpl({required this.database});

  @override
  Future<List<ProductModel>> getProducts() async {
    final rows = await database.select(database.productTable).get();
    return rows.map(ProductModel.fromDrift).toList();
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    final query = database.select(database.productTable)
      ..where((t) => t.id.equals(id.toString()));
    final row = await query.getSingleOrNull();
    if (row == null) {
      throw const CacheException('Product not found in cache');
    }
    return ProductModel.fromDrift(row);
  }

  @override
  Future<void> cacheProducts(List<Product> products) async {
    await database.batch((batch) {
      for (final product in products) {
        batch.insert(
          database.productTable,
          ProductModel.fromEntity(product).toDriftCompanion(),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Future<void> cacheProduct(Product product) async {
    await database
        .into(database.productTable)
        .insert(
          ProductModel.fromEntity(product).toDriftCompanion(),
          mode: InsertMode.insertOrReplace,
        );
  }
}
