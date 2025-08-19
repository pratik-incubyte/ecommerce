import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUseCase implements UseCase<Cart, GetCartItemsParams> {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  @override
  Future<Either<Failure, Cart>> call(GetCartItemsParams params) {
    return repository.getCart(params.userId);
  }
}

class GetCartItemsParams extends Params {
  final String userId;

  const GetCartItemsParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
