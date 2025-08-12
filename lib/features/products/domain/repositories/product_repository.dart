import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    int? limit,
    int? offset,
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    bool descending = false,
  });

  Future<Either<Failure, ProductEntity>> getProductById(String id);

  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts();

  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);

  Future<Either<Failure, List<String>>> getCategories();

  Stream<Either<Failure, List<ProductEntity>>> watchProducts();

  Future<Either<Failure, void>> syncProducts();
}