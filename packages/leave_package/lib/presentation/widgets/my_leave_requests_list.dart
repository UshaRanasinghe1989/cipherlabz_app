import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_provider.dart';
import 'package:leave_package/leave_package.dart';
import 'package:login_package/login_package.dart';

class MyLeaveRequestsList extends ConsumerStatefulWidget {
  const MyLeaveRequestsList({super.key});

  @override
  ConsumerState<MyLeaveRequestsList> createState() =>
      _MyLeaveRequestsListState();
}

class _MyLeaveRequestsListState extends ConsumerState<MyLeaveRequestsList> {
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
      ref.read(leaveProvider.notifier).getMyLeaveRequests(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final leaveState = ref.watch(leaveProvider);
    final list = leaveState.myLeaveList;

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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return MyLeaveRequestItem(entity: item);
      },
    );
  }
}
