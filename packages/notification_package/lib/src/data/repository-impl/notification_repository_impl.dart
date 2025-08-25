import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/web.dart';
import 'package:notification_package/notification_package.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDatasource dataSource;
  final logger = Logger();

  NotificationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, NotificationEntity>> saveNotification({
    required int userId,
    required String title,
    required String message,
    required DateTime createdAt,
  }) {
    // TODO: implement saveNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> fetchUserNotifications(
    int userId,
  ) async {
    final result = await dataSource.fetchUserNotifications(userId);

    if (result.isNotEmpty) {
      List<NotificationEntity> entityResult = result
          .map((e) => e.toEntity())
          .toList();

      return Right(entityResult);
    } else {
      logger.i("repository - No notifications available");
      return Left(
        GeneralFailure(errorMessage: "Notifications are not available"),
      );
    }
  }
}
