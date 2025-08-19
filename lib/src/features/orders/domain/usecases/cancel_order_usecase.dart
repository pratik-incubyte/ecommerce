import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';

/// Use case for cancelling an order
class CancelOrderUseCase implements UseCase<Unit, CancelOrderParams> {
  final OrdersRepository repository;

  CancelOrderUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(CancelOrderParams params) async {
    return await repository.cancelOrder(
      userId: params.userId,
      orderId: params.orderId,
    );
  }
}

/// Parameters for cancelling an order
class CancelOrderParams extends Params {
  final String userId;
  final int orderId;

  const CancelOrderParams({required this.userId, required this.orderId});

  @override
  List<Object?> get props => [userId, orderId];
}
