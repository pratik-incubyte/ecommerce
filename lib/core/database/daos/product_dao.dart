import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/product_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);

  Future<List<Product>> getAllProducts() {
    return select(products).get();
  }

  Future<Product?> getProductById(String productId) {
    return (select(products)..where((tbl) => tbl.productId.equals(productId)))
        .getSingleOrNull();
  }

  Future<List<Product>> getProductsByCategory(String category) {
    return (select(products)..where((tbl) => tbl.category.equals(category)))
        .get();
  }

  Future<List<Product>> getFeaturedProducts() {
    return (select(products)..where((tbl) => tbl.isFeatured.equals(true)))
        .get();
  }

  Future<List<Product>> searchProducts(String query) {
    return (select(products)
          ..where((tbl) =>
              tbl.name.contains(query) |
              tbl.description.contains(query) |
              tbl.category.contains(query) |
              tbl.brand.contains(query)))
        .get();
  }

  Future<List<Product>> getProductsPaginated({
    required int limit,
    required int offset,
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    bool descending = false,
  }) {
    final query = select(products);

    if (category != null) {
      query.where((tbl) => tbl.category.equals(category));
    }

    if (minPrice != null) {
      query.where((tbl) => tbl.price.isBiggerOrEqualValue(minPrice));
    }

    if (maxPrice != null) {
      query.where((tbl) => tbl.price.isSmallerOrEqualValue(maxPrice));
    }

    switch (sortBy) {
      case 'price':
        query.orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.price,
                mode: descending ? OrderingMode.desc : OrderingMode.asc,
              )
        ]);
        break;
      case 'rating':
        query.orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.rating,
                mode: descending ? OrderingMode.desc : OrderingMode.asc,
              )
        ]);
        break;
      case 'name':
        query.orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.name,
                mode: descending ? OrderingMode.desc : OrderingMode.asc,
              )
        ]);
        break;
      default:
        query.orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              )
        ]);
    }

    query.limit(limit, offset: offset);
    return query.get();
  }

  Stream<List<Product>> watchProducts() {
    return select(products).watch();
  }

  Stream<Product?> watchProduct(String productId) {
    return (select(products)..where((tbl) => tbl.productId.equals(productId)))
        .watchSingleOrNull();
  }

  Future<int> insertProduct(ProductsCompanion product) {
    return into(products).insert(product);
  }

  Future<void> insertProducts(List<ProductsCompanion> productList) {
    return batch((batch) {
      batch.insertAll(products, productList);
    });
  }

  Future<bool> updateProduct(ProductsCompanion product) {
    return update(products).replace(product);
  }

  Future<int> deleteProduct(String productId) {
    return (delete(products)..where((tbl) => tbl.productId.equals(productId)))
        .go();
  }

  Future<void> updateStock(String productId, int quantity) {
    return (update(products)..where((tbl) => tbl.productId.equals(productId)))
        .write(ProductsCompanion(stockQuantity: Value(quantity)));
  }

  Future<List<String>> getCategories() async {
    final query = selectOnly(products, distinct: true)
      ..addColumns([products.category]);
    final result = await query.get();
    return result.map((row) => row.read(products.category)!).toList();
  }
}