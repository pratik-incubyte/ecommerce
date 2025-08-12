import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/products/domain/usecases/get_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/src/features/products/domain/repositories/products_repository.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

import 'get_products_usecase_test.mocks.dart';

@GenerateMocks([ProductsRepository, Product])
void main() {
  late ProductsRepository repository;
  late GetProductsUseCase useCase;
  late List<Product> products;

  setUp(() {
    repository = MockProductsRepository();
    useCase = GetProductsUseCase(repository);
    products = List.generate(9, (index) => MockProduct());
  });

  test('should get products list when getProducts is called', () async {
    when(repository.getProducts()).thenAnswer((_) async => Right(products));

    final result = await useCase(NoParams());

    expect(result, Right(products));
  });
}
