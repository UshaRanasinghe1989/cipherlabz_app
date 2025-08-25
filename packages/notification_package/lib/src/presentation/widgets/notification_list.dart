import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:notification_package/notification_package.dart';

class NotificationListWidget extends ConsumerStatefulWidget {
  const NotificationListWidget({super.key});

  @override
  ConsumerState<NotificationListWidget> createState() =>
      _NotificationListWidgetState();
}

class _NotificationListWidgetState
    extends ConsumerState<NotificationListWidget> {
  final logger = Logger();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //GET SUBORDINATE REPORT
    final notificationState = ref.watch(notificationAsyncNotifierProvider);

    return notificationState.when(
      data: (notifications) {
        if (notifications.isEmpty) {
          return const Center(child: Text("No notifications available"));
        }
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationItemCard(entity: notification);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
