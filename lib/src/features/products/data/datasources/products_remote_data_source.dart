import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final FirebaseFirestore firestore;
  ProductsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final snapshot = await firestore.collection('products').get();
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch products');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final doc = await firestore.collection('products').doc('$id').get();
      if (!doc.exists) {
        throw const ServerException('Product not found');
      }
      return ProductModel.fromJson(doc.data()!);
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException('Failed to fetch product');
    }
  }
}
