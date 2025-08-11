import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_provider.dart';
import 'package:leave_package/leave_package.dart';
import 'package:login_package/login_package.dart';

class PendingLeaveRequestsList extends ConsumerStatefulWidget {
  const PendingLeaveRequestsList({super.key});

  @override
  ConsumerState<PendingLeaveRequestsList> createState() =>
      _PendingLeaveRequestsListState();
}

class _PendingLeaveRequestsListState
    extends ConsumerState<PendingLeaveRequestsList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final loginProviderRef = ref.read(loginProvider);
      final user = loginProviderRef.user;
      if (user == null) {
        return const Center(child: Text('User not logged in'));
      }
      final id = user.id;

      //GET MY LEAVE REQUESTS
      DateTime now = DateTime.now();
      DateTime fromDate = DateTime(now.year, now.month, now.day);
      DateTime toDate = DateTime(now.year, 12, 31);

      ref
          .watch(leaveProvider.notifier)
          .getLeaveRequestsByStatus(
            fromDate,
            toDate,
            LeaveRequestStatus.pending,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaveState = ref.watch(leaveProvider);
    final list = leaveState.leaveWithUserList;

    if (leaveState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (leaveState.failure != null) {
      return const Center(child: Text("Error occurred while loading leaves"));
    }

    if (list == null || list.isEmpty) {
      return const Center(child: Text("No leave records found"));
    }

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return PendingLeaveRequestCard(entity: item);
      },
    );
  }
}
