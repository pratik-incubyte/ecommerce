import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/checkout/domain/repositories/checkout_repository.dart';

/// Use case for calculating checkout totals
class CalculateCheckoutUseCase
    implements UseCase<Checkout, CalculateCheckoutParams> {
  final CheckoutRepository repository;

  CalculateCheckoutUseCase(this.repository);

  @override
  Future<Either<Failure, Checkout>> call(CalculateCheckoutParams params) async {
    return await repository.calculateCheckout(
      userId: params.userId,
      shippingMethod: params.shippingMethod,
      shippingAddress: params.shippingAddress,
      promoCode: params.promoCode,
    );
  }
}

/// Parameters for calculating checkout
class CalculateCheckoutParams extends Params {
  final String userId;
  final String shippingMethod;
  final Map<String, dynamic> shippingAddress;
  final String? promoCode;

  const CalculateCheckoutParams({
    required this.userId,
    required this.shippingMethod,
    required this.shippingAddress,
    this.promoCode,
  });

  @override
  List<Object?> get props => [
    userId,
    shippingMethod,
    shippingAddress,
    promoCode,
  ];
}
