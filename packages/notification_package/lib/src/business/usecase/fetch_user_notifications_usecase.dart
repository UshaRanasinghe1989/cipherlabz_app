import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:notification_package/notification_package.dart';

class FetchUserNotificationsUsecase {
  final NotificationRepository repository;

  FetchUserNotificationsUsecase({required this.repository});

  Future<Either<Failure, List<NotificationEntity>>> call(int userId) async {
    return await repository.fetchUserNotifications(userId);
  }
}
