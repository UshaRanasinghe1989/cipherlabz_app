import 'package:core/core.dart';
import 'package:notification_package/notification_package.dart';

class NotificationState {
  final bool isLoading;
  final Failure? failure;
  final NotificationEntity? notificationEntity;
  final List<NotificationEntity>? notificationList;

  NotificationState({
    this.isLoading = false,
    this.failure,
    this.notificationEntity,
    this.notificationList,
  });

  NotificationState copyWith({
    bool? isLoading,
    Failure? failure,
    NotificationEntity? notificationEntity,
    List<NotificationEntity>? notificationList,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      notificationEntity: notificationEntity,
      notificationList: notificationList ?? this.notificationList,
    );
  }
}
