import 'package:notification_package/src/business/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.iconName,
    required super.message,
    required super.createdAt,
  });
}
