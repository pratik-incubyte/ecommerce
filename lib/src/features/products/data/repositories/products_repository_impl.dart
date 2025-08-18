import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_local_data_source.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_remote_data_source.dart';

import 'package:ecommerce/src/features/products/domain/entities/product.dart';

import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      if (await networkInfo.isConnected) {
        final products = await remoteDataSource.getProducts();
        if (products.isNotEmpty) {
          await localDataSource.cacheProducts(products);
        }
        return Right(products);
      }
      return Right(await localDataSource.getProducts());
    } catch (_) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct({required int id}) async {
    try {
      if (await networkInfo.isConnected) {
        final product = await remoteDataSource.getProduct(id);
        await localDataSource.cacheProduct(product);
        return Right(product);
      }
      return Right(await localDataSource.getProduct(id));
    } catch (_) {
      return Left(GeneralFailure());
    }
  }
}
