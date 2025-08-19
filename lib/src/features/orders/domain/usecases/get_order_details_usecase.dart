import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';

/// Use case for getting order details
class GetOrderDetailsUseCase implements UseCase<Order, GetOrderDetailsParams> {
  final OrdersRepository repository;

  GetOrderDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, Order>> call(GetOrderDetailsParams params) async {
    return await repository.getOrderById(
      userId: params.userId,
      orderId: params.orderId,
    );
  }
}

/// Parameters for getting order details
class GetOrderDetailsParams extends Params {
  final String userId;
  final String orderId;

  const GetOrderDetailsParams({required this.userId, required this.orderId});

  @override
  List<Object?> get props => [userId, orderId];
}
