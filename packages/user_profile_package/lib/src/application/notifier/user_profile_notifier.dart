import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_package/notification_package.dart';

class UserProfileNotifier extends Notifier<NotificationState> {
  late final NotificationUsecases _notificationUsecases = ref.read(
    notificationUseCasesProvider,
  );

  @override
  build() {
    return NotificationState();
  }

  //SAVE LEAVE REQUEST
  Future<void> saveNotification({
    required int userId,
    required String title,
    required String message,
    required DateTime createdAt,
  }) async {
    //LOADING
    state = state.copyWith(isLoading: true);
    //GET RESULT
    final Either<Failure, NotificationEntity> result =
        await _notificationUsecases.saveNotificationUsecase.call(
          userId: userId,
          title: title,
          message: message,
          createdAt: createdAt,
        );

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: failure), //FAILD
      (entity) => state.copyWith(
        isLoading: false,
        notificationEntity: entity,
      ), //SUCCESS - NOTIFICATION ENTITY
    );
  }
}
