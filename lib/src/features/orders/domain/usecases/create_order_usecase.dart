import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';

/// Use case for creating a new order
class CreateOrderUseCase implements UseCase<Order, CreateOrderParams> {
  final OrdersRepository repository;

  CreateOrderUseCase(this.repository);

  @override
  Future<Either<Failure, Order>> call(CreateOrderParams params) async {
    return await repository.createOrder(
      userId: params.userId,
      items: params.items,
      shippingAddress: params.shippingAddress,
      billingAddress: params.billingAddress,
      paymentMethod: params.paymentMethod,
      shippingMethod: params.shippingMethod,
      totalAmount: params.totalAmount,
      discountAmount: params.discountAmount,
      promoCode: params.promoCode,
      notes: params.notes,
    );
  }
}

/// Parameters for creating an order
class CreateOrderParams extends Params {
  final String userId;
  final List<Map<String, dynamic>> items;
  final Map<String, dynamic> shippingAddress;
  final Map<String, dynamic> billingAddress;
  final String paymentMethod;
  final String shippingMethod;
  final double totalAmount;
  final double? discountAmount;
  final String? promoCode;
  final String? notes;

  const CreateOrderParams({
    required this.userId,
    required this.items,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.totalAmount,
    this.discountAmount,
    this.promoCode,
    this.notes,
  });

  @override
  List<Object?> get props => [
    userId,
    items,
    shippingAddress,
    billingAddress,
    paymentMethod,
    shippingMethod,
    totalAmount,
    discountAmount,
    promoCode,
    notes,
  ];
}
