import 'package:dartz/dartz.dart';
import '../../../error/exceptions.dart';
import '../../../error/failures.dart';
import '../../../network/network_info.dart';
import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_data_source.dart';

/// Implementation of notification repository
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> initializeNotifications() async {
    try {
      await remoteDataSource.initializeFirebaseMessaging();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to initialize notifications: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> getDeviceToken() async {
    try {
      final token = await remoteDataSource.getDeviceToken();
      return Right(token);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to get device token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendNotification({
    required String userId,
    required String title,
    required String body,
    String? imageUrl,
    Map<String, String>? data,
    NotificationType type = NotificationType.general,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        // In a real implementation, you would call your backend API here
        // For now, we'll just return success
        return const Right(unit);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to send notification: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendOrderNotification({
    required String userId,
    required String orderId,
    required String orderTotal,
  }) async {
    try {
      await remoteDataSource.sendOrderNotification(
        userId: userId,
        orderId: orderId,
        orderTotal: orderTotal,
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to send order notification: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> subscribeToTopic(String topic) async {
    try {
      await remoteDataSource.subscribeToTopic(topic);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to subscribe to topic: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> unsubscribeFromTopic(String topic) async {
    try {
      await remoteDataSource.unsubscribeFromTopic(topic);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to unsubscribe from topic: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> handleBackgroundMessage() async {
    try {
      // This would be handled by the data source initialization
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to handle background message: ${e.toString()}'));
    }
  }
}
