import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:notification_package/notification_package.dart';

class SaveNotificationUsecase {
  final NotificationRepository repository;

  SaveNotificationUsecase({required this.repository});

  Future<Either<Failure, NotificationEntity>> call({
    required int userId,
    required String title,
    required String message,
    required DateTime createdAt,
  }) async {
    return await repository.saveNotification(
      userId: userId,
      title: title,
      message: message,
      createdAt: createdAt,
    );
  }
}
