import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';

/// Use case for getting user orders
class GetOrdersUseCase implements UseCase<List<Order>, GetOrdersParams> {
  final OrdersRepository repository;

  GetOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Order>>> call(GetOrdersParams params) async {
    return await repository.getOrders(
      userId: params.userId,
      page: params.page,
      limit: params.limit,
    );
  }
}

/// Parameters for getting orders
class GetOrdersParams extends Params {
  final String userId;
  final int page;
  final int limit;

  const GetOrdersParams({required this.userId, this.page = 1, this.limit = 20});

  @override
  List<Object?> get props => [userId, page, limit];
}
