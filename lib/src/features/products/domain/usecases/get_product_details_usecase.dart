import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:ecommerce/src/features/products/domain/repositories/products_repository.dart';

class GetProductDetailsUseCase implements UseCase<Product, GetProductParams> {
  final ProductsRepository repository;
  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetProductParams params) =>
      repository.getProduct(id: params.id);
}

class GetProductParams extends Params {
  final int id;

  const GetProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
