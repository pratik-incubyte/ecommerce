import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartUseCase implements UseCase<void, RemoveFromCartParams> {
  final CartRepository repository;
  
  RemoveFromCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RemoveFromCartParams params) {
    return repository.removeFromCart(
      userId: params.userId,
      productId: params.productId,
    );
  }
}

class RemoveFromCartParams extends Params {
  final String userId;
  final int productId;

  const RemoveFromCartParams({
    required this.userId,
    required this.productId,
  });

  @override
  List<Object?> get props => [userId, productId];
}
