import 'package:dartz/dartz.dart';
import '../../../error/failures.dart';
import '../entities/notification.dart';

/// Repository interface for notification operations
abstract class NotificationRepository {
  /// Send a push notification to a specific user
  Future<Either<Failure, Unit>> sendNotification({
    required String userId,
    required String title,
    required String body,
    String? imageUrl,
    Map<String, String>? data,
    NotificationType type = NotificationType.general,
  });

  /// Send an order confirmation notification
  Future<Either<Failure, Unit>> sendOrderNotification({
    required String userId,
    required String orderId,
    required String orderTotal,
  });

  /// Initialize notification services
  Future<Either<Failure, Unit>> initializeNotifications();

  /// Get device token for push notifications
  Future<Either<Failure, String>> getDeviceToken();

  /// Subscribe to a topic for notifications
  Future<Either<Failure, Unit>> subscribeToTopic(String topic);

  /// Unsubscribe from a topic
  Future<Either<Failure, Unit>> unsubscribeFromTopic(String topic);

  /// Handle notification when app is in background/terminated
  Future<Either<Failure, Unit>> handleBackgroundMessage();
}
