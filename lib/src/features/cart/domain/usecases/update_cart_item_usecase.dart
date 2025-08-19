import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartItemUseCase implements UseCase<CartItem, UpdateCartItemParams> {
  final CartRepository repository;
  
  UpdateCartItemUseCase(this.repository);

  @override
  Future<Either<Failure, CartItem>> call(UpdateCartItemParams params) {
    return repository.updateCartItemQuantity(
      userId: params.userId,
      productId: params.productId,
      quantity: params.quantity,
    );
  }
}

class UpdateCartItemParams extends Params {
  final String userId;
  final int productId;
  final int quantity;

  const UpdateCartItemParams({
    required this.userId,
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [userId, productId, quantity];
}
