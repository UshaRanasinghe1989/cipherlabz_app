import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_package/notification_package.dart';

final notificationAsyncNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      NotificationAsyncNotifier,
      List<NotificationEntity>
    >(NotificationAsyncNotifier.new);
