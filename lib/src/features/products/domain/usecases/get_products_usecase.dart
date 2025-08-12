import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:ecommerce/src/features/products/domain/repositories/products_repository.dart';

class GetProductsUseCase implements UseCase<List<Product>, NoParams> {
  final ProductsRepository repository;
  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) =>
      repository.getProducts();
}
