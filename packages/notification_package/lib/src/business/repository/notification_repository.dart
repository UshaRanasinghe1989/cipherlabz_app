import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:notification_package/notification_package.dart';

abstract class NotificationRepository {
  //SAVE NOTIFICATION
  Future<Either<Failure, NotificationEntity>> saveNotification({
    required int userId,
    required String title,
    required String message,
    required DateTime createdAt,
  });
  //FETCH NOTIFICATIONS FOR A USER
  Future<Either<Failure, List<NotificationEntity>>> fetchUserNotifications(
    int userId,
  );
}
