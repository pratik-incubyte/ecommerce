import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemCountUseCase implements UseCase<int, GetCartItemCountParams> {
  final CartRepository repository;
  
  GetCartItemCountUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(GetCartItemCountParams params) {
    return repository.getCartItemCount(params.userId);
  }
}

class GetCartItemCountParams extends Params {
  final String userId;

  const GetCartItemCountParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
