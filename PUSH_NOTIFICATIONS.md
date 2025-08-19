# Push Notifications Implementation

This document explains the push notification system implemented in the eCommerce app following Clean Architecture principles with Flutter Bloc.

## 🚀 Features

- **Order Confirmation Notifications**: Automatically sent when an order is successfully placed
- **Deep Linking**: Clicking on notifications opens the order details page directly
- **Clean Architecture**: Following the established feature-first organization pattern
- **Cross-Platform**: Works on both Android and iOS
- **Local & Remote Notifications**: Uses Firebase Cloud Messaging (FCM) and local notifications

## 🏗️ Architecture

The notification system follows Clean Architecture with these layers:

### Domain Layer
- **Entities**: `NotificationEntity` - Domain model for notifications
- **Repository Interface**: `NotificationRepository` - Abstract contract for notification operations
- **Use Cases**: 
  - `InitializeNotifications` - Sets up notification services
  - `SendOrderNotification` - Sends order confirmation notifications

### Data Layer
- **Repository Implementation**: `NotificationRepositoryImpl` - Concrete implementation
- **Data Sources**: `NotificationRemoteDataSource` - Handles FCM and local notifications

### Presentation Layer
- Integrated with `CheckoutBloc` to send notifications on order completion

## 📁 Directory Structure

```
lib/src/core/notifications/
├── domain/
│   ├── entities/
│   │   └── notification.dart               # Domain entity
│   ├── repositories/
│   │   └── notification_repository.dart    # Repository interface
│   └── usecases/
│       ├── initialize_notifications.dart   # Initialization use case
│       └── send_order_notification.dart    # Order notification use case
├── data/
│   ├── datasources/
│   │   └── notification_remote_data_source.dart  # FCM & local notifications
│   └── repositories/
│       └── notification_repository_impl.dart     # Repository implementation
└── di/
    └── notification_injection.dart         # Dependency injection setup
```

## 🔧 Implementation Details

### 1. Dependencies Added

```yaml
dependencies:
  firebase_messaging: ^15.1.3
  flutter_local_notifications: ^18.0.1
```

### 2. Initialization

The notification system is initialized in `main.dart`:

```dart
// Initialize push notifications
final initializeNotifications = getIt<InitializeNotifications>();
await initializeNotifications(NoParams());
```

### 3. Order Notification Flow

When an order is completed:

1. **CheckoutBloc** completes the order
2. **SendOrderNotification** use case is called
3. **NotificationRemoteDataSource** shows a local notification
4. User taps notification → Deep link opens order details page

### 4. Deep Linking Integration

Notifications include payload data with:
- `orderId`: The order ID to navigate to
- `userId`: The user ID for authorization

When tapped, the app navigates using:
```dart
GoRouter.of(context).goNamed(
  'order-details-deeplink',
  pathParameters: {'orderId': orderId},
  queryParameters: userId != null ? {'userId': userId} : null,
);
```

## 🔐 Permissions

### Android
The app automatically requests notification permissions.

### iOS
The app requests notification permissions including:
- Alert notifications
- Sound notifications
- Badge notifications

## 🎯 Usage

### Sending Order Notifications

The notification is automatically sent when an order is placed in the checkout flow:

```dart
// In CheckoutBloc._onCompleteCheckout
await sendOrderNotification(
  SendOrderNotificationParams(
    userId: checkout.userId,
    orderId: order.id!,
    orderTotal: order.totalAmount.toStringAsFixed(2),
  ),
);
```

### Notification Content

Order notifications show:
- **Title**: "Order Confirmed! 🎉"
- **Body**: "Your order #[ORDER_ID] for $[TOTAL] has been placed successfully. Tap to view details."
- **Action**: Taps open the order details page

## 🧪 Testing

### Testing Notifications

1. **Place an Order**: 
   - Add items to cart
   - Go through checkout flow
   - Complete payment
   - Notification should appear

2. **Test Deep Linking**:
   - Tap on the notification
   - App should open to order details page
   - Verify correct order is displayed

### Troubleshooting

1. **No Notifications Appearing**:
   - Check device notification permissions
   - Verify Firebase is properly initialized
   - Check console logs for errors

2. **Deep Linking Not Working**:
   - Verify router configuration
   - Check payload data format
   - Ensure order details page can handle the orderId

## 🚀 Production Considerations

### Backend Integration

For production, implement a backend service to:

1. **Send FCM Messages**: Use Firebase Admin SDK to send notifications to specific users
2. **Store Device Tokens**: Save FCM tokens for each user
3. **Notification History**: Track sent notifications for analytics

### Example Backend Endpoint

```javascript
// Node.js with Firebase Admin SDK
async function sendOrderNotification(userId, orderId, orderTotal) {
  const userToken = await getUserFCMToken(userId);
  
  const message = {
    token: userToken,
    notification: {
      title: 'Order Confirmed! 🎉',
      body: `Your order #${orderId} for $${orderTotal} has been placed successfully.`
    },
    data: {
      orderId: orderId,
      userId: userId,
      type: 'order_confirmation'
    }
  };
  
  await admin.messaging().send(message);
}
```

### Security

- Validate user permissions before showing order details
- Sanitize payload data
- Use secure deep link handling

## 🔮 Future Enhancements

1. **Notification Types**:
   - Order status updates (shipped, delivered)
   - Promotional notifications
   - Cart abandonment reminders

2. **User Preferences**:
   - Allow users to toggle notification types
   - Quiet hours settings
   - Frequency controls

3. **Rich Notifications**:
   - Images in notifications
   - Action buttons (Track Order, Contact Support)
   - Progress indicators

4. **Analytics**:
   - Track notification delivery rates
   - Monitor click-through rates
   - A/B test notification content

## 📚 References

- [Firebase Cloud Messaging Documentation](https://firebase.google.com/docs/cloud-messaging)
- [Flutter Local Notifications Plugin](https://pub.dev/packages/flutter_local_notifications)
- [GoRouter Deep Linking](https://docs.flutter.dev/ui/navigation/deep-linking)
- [Clean Architecture in Flutter](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

The notification system provides a seamless user experience by automatically informing users of successful orders and providing quick access to order details through deep linking, all while maintaining clean architecture principles.
