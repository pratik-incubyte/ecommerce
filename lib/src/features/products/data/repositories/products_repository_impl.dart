import '../../domain/repositories/products_repository.dart';
class ProductsRepositoryImpl implements ProductsRepository {
  final dynamic remoteDataSource;
  final dynamic localDataSource;
  final dynamic networkInfo;
  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
}
