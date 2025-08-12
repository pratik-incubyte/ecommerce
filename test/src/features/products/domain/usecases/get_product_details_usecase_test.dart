import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/features/products/domain/usecases/get_product_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/src/features/products/domain/repositories/products_repository.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

import 'get_products_usecase_test.mocks.dart';

@GenerateMocks([ProductsRepository, Product])
void main() {
  late ProductsRepository repository;
  late GetProductDetailsUseCase useCase;
  late Product product;

  setUp(() {
    repository = MockProductsRepository();
    useCase = GetProductDetailsUseCase(repository);
    product = MockProduct();
  });

  test(
    'should get product list when getProduct is called by passing product id',
    () async {
      when(
        repository.getProduct(id: 1),
      ).thenAnswer((_) async => Right(product));

      final result = await useCase(GetProductParams(id: 1));

      expect(result, Right(product));
    },
  );
}
