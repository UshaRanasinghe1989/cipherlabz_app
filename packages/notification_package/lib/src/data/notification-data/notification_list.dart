import 'package:notification_package/notification_package.dart';

class NotificationData {
  static List<NotificationModel> notificationList = [
    NotificationModel(
      id: 0,
      userId: 0,
      title: "Leave Request",
      iconName: "leave_approved",
      message: "Leave approved",
      createdAt: DateTime(2025, 8, 21, 10, 30),
    ),
    NotificationModel(
      id: 1,
      userId: 0,
      title: "Birthday Reminder",
      iconName: "birthday_reminder",
      message: "It`s Charith`s birthday today",
      createdAt: DateTime(2025, 8, 19, 8, 30),
    ),
    NotificationModel(
      id: 2,
      userId: 0,
      title: "Leave Request",
      iconName: "leave_rejected",
      message: "Leave rejected",
      createdAt: DateTime(2025, 8, 22, 8, 30),
    ),
    NotificationModel(
      id: 3,
      userId: 0,
      title: "Notification 4",
      iconName: "birthday_reminder",
      message: "Notification 4",
      createdAt: DateTime(2025, 8, 23, 8, 30),
    ),
    NotificationModel(
      id: 3,
      userId: 0,
      title: "Notification 5",
      iconName: "leave_approved",
      message: "Notification 5",
      createdAt: DateTime(2025, 8, 20, 8, 30),
    ),
  ];
}
