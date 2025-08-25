import 'package:notification_package/notification_package.dart';

//MODEL -> ENTITY
extension NotificationModelToEntityMapper on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      userId: userId,
      title: title,
      iconName: iconName,
      message: message,
      createdAt: createdAt,
    );
  }
}

//ENTITY -> MODEL
extension NotificationEntityToModelMapper on NotificationEntity {
  NotificationModel toModel() {
    return NotificationModel(
      id: id,
      userId: userId,
      title: title,
      iconName: iconName,
      message: message,
      createdAt: createdAt,
    );
  }
}
