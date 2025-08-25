import 'package:notification_package/notification_package.dart';

class NotificationUsecases {
  final SaveNotificationUsecase saveNotificationUsecase;
  final FetchUserNotificationsUsecase fetchUserNotificationsUsecase;

  NotificationUsecases({
    required this.saveNotificationUsecase,
    required this.fetchUserNotificationsUsecase,
  });
}
