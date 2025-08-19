import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/repositories/checkout_repository.dart';

/// Use case for processing payment
class ProcessPaymentUseCase
    implements UseCase<Map<String, dynamic>, ProcessPaymentParams> {
  final CheckoutRepository repository;

  ProcessPaymentUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
    ProcessPaymentParams params,
  ) async {
    return await repository.processPayment(
      paymentMethod: params.paymentMethod,
      amount: params.amount,
      paymentDetails: params.paymentDetails,
    );
  }
}

/// Parameters for processing payment
class ProcessPaymentParams extends Params {
  final String paymentMethod;
  final double amount;
  final Map<String, dynamic> paymentDetails;

  const ProcessPaymentParams({
    required this.paymentMethod,
    required this.amount,
    required this.paymentDetails,
  });

  @override
  List<Object?> get props => [paymentMethod, amount, paymentDetails];
}
