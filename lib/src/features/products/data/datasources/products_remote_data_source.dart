import 'package:ecommerce/src/features/products/data/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final dynamic dioClient;
  ProductsRemoteDataSourceImpl({required this.dioClient});

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
