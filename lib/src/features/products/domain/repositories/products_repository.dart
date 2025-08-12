import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();

  Future<Either<Failure, Product>> getProduct({required int id});
}
