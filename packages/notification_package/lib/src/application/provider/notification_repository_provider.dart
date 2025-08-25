import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_package/notification_package.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final dataSource = ref.read(notificationDataSourceProvider);
  return NotificationRepositoryImpl(dataSource: dataSource);
});
