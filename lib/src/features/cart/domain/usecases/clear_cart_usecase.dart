import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUseCase implements UseCase<void, ClearCartParams> {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ClearCartParams params) {
    return repository.clearCart(params.userId);
  }
}

class ClearCartParams extends Params {
  final String userId;

  const ClearCartParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
