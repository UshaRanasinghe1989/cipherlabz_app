import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_package/notification_package.dart';

final notificationUseCasesProvider = Provider<NotificationUsecases>((ref) {
  final repository = ref.read(notificationRepositoryProvider);

  return NotificationUsecases(
    saveNotificationUsecase: SaveNotificationUsecase(repository: repository),
    fetchUserNotificationsUsecase: FetchUserNotificationsUsecase(
      repository: repository,
    ),
  );
});
