// Notification entity representing a push notification
// TODO: Re-enable when freezed issue is resolved
// @freezed
// class NotificationEntity with _$NotificationEntity {
//   const factory NotificationEntity({
//     required String id,
//     required String title,
//     required String body,
//     String? imageUrl,
//     required Map<String, String> data,
//     required DateTime createdAt,
//     @Default(false) bool isRead,
//     @Default(NotificationType.order) NotificationType type,
//   }) = _NotificationEntity;
// }

/// Types of notifications supported by the app
enum NotificationType {
  order,
  promotion,
  general,
}
