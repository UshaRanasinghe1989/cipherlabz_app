import 'package:logger/web.dart';
import 'package:notification_package/notification_package.dart';

class NotificationDatasourceImpl implements NotificationDatasource {
  final logger = Logger();

  @override
  Future<NotificationModel> saveNotification(NotificationModel model) {
    // TODO: implement saveNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> fetchUserNotifications(int userId) async {
    try {
      final notificationsList = NotificationData.notificationList;
      logger.d(
        "datasource:notificationsList length- ${notificationsList.length} userId: $userId",
      );
      //MY ANNUAL LEAVES LIST
      List<NotificationModel> userNotificationList = [];
      if (notificationsList.isNotEmpty) {
        userNotificationList = notificationsList
            .where(
              (e) => e.userId == userId,
              //&& DatetimeHelpers.isAfterDateOnly(e.fromDate, fromDate),
            )
            .toList();
      }
      logger.i(
        "datasource:userNotificationList - ${userNotificationList.length}",
      );
      return userNotificationList;
    } catch (e, stack) {
      logger.w(
        "Exception in getMyAnnualLeaveRequests",
        error: e,
        stackTrace: stack,
      );
      rethrow;
    }
  }
}
