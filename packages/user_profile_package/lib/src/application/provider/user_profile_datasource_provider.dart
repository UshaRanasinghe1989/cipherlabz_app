import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_package/notification_package.dart';

final notificationDataSourceProvider = Provider<NotificationDatasource>((ref) {
  return NotificationDatasourceImpl();
});
