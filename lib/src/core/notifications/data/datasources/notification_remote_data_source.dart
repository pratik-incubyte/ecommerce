import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import '../../../error/exceptions.dart';
import '../../../router/app_router.dart';

/// Remote data source for handling Firebase Cloud Messaging
abstract class NotificationRemoteDataSource {
  /// Send order notification via FCM
  Future<void> sendOrderNotification({
    required String userId,
    required String orderId,
    required String orderTotal,
  });

  /// Initialize Firebase messaging
  Future<void> initializeFirebaseMessaging();

  /// Get FCM token
  Future<String> getDeviceToken();

  /// Subscribe to topic
  Future<void> subscribeToTopic(String topic);

  /// Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic);
}

/// Implementation of notification remote data source
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotifications;

  NotificationRemoteDataSourceImpl({
    required FirebaseMessaging firebaseMessaging,
    required FlutterLocalNotificationsPlugin localNotifications,
  })  : _firebaseMessaging = firebaseMessaging,
        _localNotifications = localNotifications;

  @override
  Future<void> initializeFirebaseMessaging() async {
    try {
      // Request permission for iOS
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle notification taps when app is in background
      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

      // Handle notification when app is opened from terminated state
      RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationTap(initialMessage);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Create notification channel for Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'order_notifications', // id
      'Order Notifications', // title
      description: 'This channel is used for order notifications.',
      importance: Importance.max,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    // Show local notification when app is in foreground
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'order_notifications',
      'Order Notifications',
      channelDescription: 'This channel is used for order notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: _createPayload(message.data ?? {}),
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      _navigateToOrderDetails(message.data);
    }
  }

  void _onNotificationTap(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null) {
      final data = _parsePayload(notificationResponse.payload!);
      _navigateToOrderDetails(data);
    }
  }

  void _navigateToOrderDetails(Map<String, dynamic> data) {
    final orderId = data['orderId'] as String?;
    final userId = data['userId'] as String?;
    
    if (orderId != null) {
      // Use the global navigator key to navigate
      final context = AppRouter.rootNavigatorKey.currentContext;
      if (context != null) {
        if (userId != null) {
          GoRouter.of(context).goNamed(
            'order-details-deeplink',
            pathParameters: {'orderId': orderId},
            queryParameters: {'userId': userId},
          );
        } else {
          GoRouter.of(context).goNamed(
            'order-details-deeplink',
            pathParameters: {'orderId': orderId},
          );
        }
      }
    }
  }

  String _createPayload(Map<String, dynamic> data) {
    // Convert data to a simple string format for payload
    return data.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  Map<String, String> _parsePayload(String payload) {
    final Map<String, String> data = {};
    final pairs = payload.split('&');
    for (final pair in pairs) {
      final parts = pair.split('=');
      if (parts.length == 2) {
        data[parts[0]] = parts[1];
      }
    }
    return data;
  }

  @override
  Future<String> getDeviceToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      if (token == null) {
        throw const ServerException('Failed to get device token');
      }
      return token;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> sendOrderNotification({
    required String userId,
    required String orderId,
    required String orderTotal,
  }) async {
    try {
      // In a real app, you would send this to your backend server
      // which would then send the notification via FCM Admin SDK
      // For now, we'll simulate by showing a local notification
      
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'order_notifications',
        'Order Notifications',
        channelDescription: 'This channel is used for order notifications.',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      );

      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails();

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );

      await _localNotifications.show(
        orderId.hashCode,
        'Order Confirmed! 🎉',
        'Your order #$orderId for \$$orderTotal has been placed successfully. Tap to view details.',
        platformChannelSpecifics,
        payload: 'orderId=$orderId&userId=$userId',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
