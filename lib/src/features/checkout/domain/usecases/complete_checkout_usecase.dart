import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';

/// Use case for completing checkout
class CompleteCheckoutUseCase
    implements UseCase<Order, CompleteCheckoutParams> {
  final CheckoutRepository repository;

  CompleteCheckoutUseCase(this.repository);

  @override
  Future<Either<Failure, Order>> call(CompleteCheckoutParams params) async {
    return await repository.completeCheckout(
      checkout: params.checkout,
      paymentResult: params.paymentResult,
    );
  }
}

/// Parameters for completing checkout
class CompleteCheckoutParams extends Params {
  final Checkout checkout;
  final Map<String, dynamic> paymentResult;

  const CompleteCheckoutParams({
    required this.checkout,
    required this.paymentResult,
  });

  @override
  List<Object?> get props => [checkout, paymentResult];
}
