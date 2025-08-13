import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';

class PendingLeaveRequestsList extends ConsumerStatefulWidget {
  const PendingLeaveRequestsList({super.key});

  @override
  ConsumerState<PendingLeaveRequestsList> createState() =>
      _PendingLeaveRequestsListState();
}

class _PendingLeaveRequestsListState
    extends ConsumerState<PendingLeaveRequestsList> {
  late final List<int>? subordinateIdList;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      //GET USER ID
      final loginProviderRef = ref.read(loginProvider);
      final user = loginProviderRef.user;
      if (user == null) {
        return const Center(child: Text('User not logged in'));
      }
      final id = user.id;
      //GET SUBORDINATES LIST
      await _getSubordinatesList(id);
      final userProviderRef = ref.watch(userProvider);
      subordinateIdList = userProviderRef.subordinateList;
      //GET SUBORDINATES LEAVE REQUESTS
      if (subordinateIdList != null) {
        print("subordinateIdList.length ${subordinateIdList!.length}");
        await _reloadPendingList(subordinateIdList!);
      } else {
        print("No subordinates availabele !");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaveState = ref.watch(leaveProvider);
    final leaveRequestWithUserList = leaveState.leaveWithUserList;

    if (leaveState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (leaveState.failure != null) {
      return const Center(child: Text("No pending leave requests available !"));
    }

    if (leaveRequestWithUserList == null || leaveRequestWithUserList.isEmpty) {
      return const Center(child: Text("No leave records found"));
    } else {
      return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: leaveRequestWithUserList.length,
        itemBuilder: (context, index) {
          final item = leaveRequestWithUserList[index];
          return PendingLeaveRequestCard(
            entity: item,
            onReload: () {
              _reloadPendingList(subordinateIdList!);
            },
          );
        },
      );
    }
  }

  Future<void> _getSubordinatesList(int superiorId) async {
    final userProviderNotifier = ref.watch(userProvider.notifier);
    userProviderNotifier.getSubordinateList(superiorId);
  }

  Future<void> _reloadPendingList(List<int> subordinateIdList) async {
    final user = ref.read(loginProvider).user;
    if (user != null) {
      DateTime now = DateTime.now();
      DateTime fromDate = DateTime(now.year, now.month, now.day);
      DateTime toDate = DateTime(now.year, 12, 31);

      await ref
          .read(leaveProvider.notifier)
          .getLeaveRequestsByStatus(
            subordinateIdList,
            fromDate,
            toDate,
            LeaveRequestStatus.pending,
          );
    }
  }
}
