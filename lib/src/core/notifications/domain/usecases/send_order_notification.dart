import 'package:dartz/dartz.dart';
import '../../../error/failures.dart';
import '../../../utils/usecase.dart';
import '../repositories/notification_repository.dart';

/// Use case for sending order confirmation notifications
class SendOrderNotification implements UseCase<Unit, SendOrderNotificationParams> {
  final NotificationRepository repository;

  SendOrderNotification(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendOrderNotificationParams params) async {
    return await repository.sendOrderNotification(
      userId: params.userId,
      orderId: params.orderId,
      orderTotal: params.orderTotal,
    );
  }
}

/// Parameters for sending order notification
class SendOrderNotificationParams {
  final String userId;
  final String orderId;
  final String orderTotal;

  SendOrderNotificationParams({
    required this.userId,
    required this.orderId,
    required this.orderTotal,
  });
}
