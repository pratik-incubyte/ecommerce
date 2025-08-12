import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/core/utils/either_extensions.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_local_data_source.dart';
import 'package:ecommerce/src/features/products/data/datasources/products_remote_data_source.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';
import 'package:ecommerce/src/features/products/data/repositories/products_repository_impl.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_repository_impl_test.mocks.dart';

@GenerateMocks([
  NetworkInfo,
  ProductsRemoteDataSource,
  ProductsLocalDataSource,
  Product,
  ProductModel,
])
void main() {
  late ProductsLocalDataSource localDataSource;
  late ProductsRemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;
  late ProductsRepositoryImpl repositoryImpl;

  late List<ProductModel> productModels;

  setUpAll(() {
    localDataSource = MockProductsLocalDataSource();
    remoteDataSource = MockProductsRemoteDataSource();
    networkInfo = MockNetworkInfo();
    repositoryImpl = ProductsRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );

    productModels = List.generate(10, (_) => MockProductModel());
  });

  group("getProduct", () {
    test("should return product when getProduct is called", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(
        remoteDataSource.getProduct(1),
      ).thenAnswer((_) async => productModels.first);

      final result = await repositoryImpl.getProduct(id: 1);

      expect(result, Right(productModels.first));
    });

    test("should return product from local db if no internet", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(
        localDataSource.getProduct(1),
      ).thenAnswer((_) async => productModels.first);

      final result = await repositoryImpl.getProduct(id: 1);

      expect(result, Right(productModels.first));
    });

    test("should return failure if there is exception", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.getProduct(1)).thenThrow(Exception());

      final result = await repositoryImpl.getProduct(id: 1);

      assert(result.isFailure);
    });
  });

  group("getProducts", () {
    test("should return products list when getProducts is called", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(
        remoteDataSource.getProducts(),
      ).thenAnswer((_) async => productModels);

      final result = await repositoryImpl.getProducts();

      expect(result, Right(productModels));
    });

    test("should return products list from local db if no internet", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(
        localDataSource.getProducts(),
      ).thenAnswer((_) async => productModels);

      final result = await repositoryImpl.getProducts();

      expect(result, Right(productModels));
    });

    test("should return failure if there is exception", () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.getProducts()).thenThrow(Exception());

      final result = await repositoryImpl.getProducts();

      assert(result.isFailure);
    });
  });
}
