import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase 
    implements UseCase<List<ProductEntity>, GetProductsParams> {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    GetProductsParams params,
  ) async {
    return await repository.getProducts(
      limit: params.limit,
      offset: params.offset,
      category: params.category,
      minPrice: params.minPrice,
      maxPrice: params.maxPrice,
      sortBy: params.sortBy,
      descending: params.descending,
    );
  }
}

class GetProductsParams extends Equatable {
  final int? limit;
  final int? offset;
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;
  final bool descending;

  const GetProductsParams({
    this.limit,
    this.offset,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.descending = false,
  });

  @override
  List<Object?> get props => [
        limit,
        offset,
        category,
        minPrice,
        maxPrice,
        sortBy,
        descending,
      ];
}