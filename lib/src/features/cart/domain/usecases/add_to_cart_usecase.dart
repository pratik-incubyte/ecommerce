import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

class AddToCartUseCase implements UseCase<CartItem, AddToCartParams> {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartItem>> call(AddToCartParams params) {
    return repository.addToCart(
      userId: params.userId,
      product: params.product,
      quantity: params.quantity,
      selectedVariants: params.selectedVariants,
    );
  }
}

class AddToCartParams extends Params {
  final String userId;
  final Product product;
  final int quantity;
  final Map<String, dynamic>? selectedVariants;

  const AddToCartParams({
    required this.userId,
    required this.product,
    this.quantity = 1,
    this.selectedVariants,
  });

  @override
  List<Object?> get props => [userId, product, quantity, selectedVariants];
}
