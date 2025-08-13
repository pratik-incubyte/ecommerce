import 'package:drift/drift.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

abstract class ProductsLocalDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getProduct(int id);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final DriftDatabase database;
  ProductsLocalDataSourceImpl({required this.database});

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  
}
