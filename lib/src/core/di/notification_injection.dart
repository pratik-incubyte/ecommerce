import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import '../notifications/data/datasources/notification_remote_data_source.dart';
import '../notifications/data/repositories/notification_repository_impl.dart';
import '../notifications/domain/repositories/notification_repository.dart';
import '../notifications/domain/usecases/initialize_notifications.dart';
import '../notifications/domain/usecases/send_order_notification.dart';

/// Initialize notification-related dependencies
void initNotificationDependencies(GetIt sl) {
  // External dependencies
  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
  sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
    () => FlutterLocalNotificationsPlugin(),
  );

  // Data sources
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(
      firebaseMessaging: sl(),
      localNotifications: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => InitializeNotifications(sl()));
  sl.registerLazySingleton(() => SendOrderNotification(sl()));
}
