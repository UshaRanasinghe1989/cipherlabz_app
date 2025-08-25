import 'package:notification_package/notification_package.dart';

abstract class NotificationDatasource {
  //SAVE NOTIFICATION
  Future<NotificationModel> saveNotification(NotificationModel model);
  //FETCH NOTIFICATIONS FOR USER
  Future<List<NotificationModel>> fetchUserNotifications(int userId);
}
