import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:login_package/login_package.dart';
import 'package:notification_package/notification_package.dart';

class NotificationAsyncNotifier
    extends AutoDisposeAsyncNotifier<List<NotificationEntity>> {
  final logger = Logger();
  final now = DateTime.now();

  late final NotificationUsecases notificationUsecases = ref.read(
    notificationUseCasesProvider,
  );

  @override
  Future<List<NotificationEntity>> build() async {
    final loginState = ref.watch(loginProvider);
    final user = loginState.user;

    if (user == null) {
      logger.i("User not loaded yet");
      return [];
    }

    // Delay fetching subordinates until after build
    Future.microtask(() async {
      await _fetchUserNotifications(userId: user.id);
    });

    return []; // build immediately returns an empty list
  }

  Future<void> _fetchUserNotifications({required int userId}) async {
    final result = await notificationUsecases.fetchUserNotificationsUsecase
        .call(userId);

    state = result.fold(
      (failure) {
        logger.e("Failed to load reports: $failure");
        return AsyncError(failure, StackTrace.current);
      },
      (list) {
        logger.i("Loaded ${list.length} notifications");
        return AsyncData(list);
      },
    );
  }
}
