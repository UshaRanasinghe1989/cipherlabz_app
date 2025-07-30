import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';

class AttendanceListWidget extends ConsumerStatefulWidget {
  const AttendanceListWidget({super.key});

  @override
  ConsumerState<AttendanceListWidget> createState() =>
      _AttendanceListWidgetState();
}

class _AttendanceListWidgetState extends ConsumerState<AttendanceListWidget> {
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
      //FETCH ATTENDANCE
      ref.read(attendanceProvider.notifier).getMyAttendanceList(id, 30);
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceProvider);
    final myAttendanceList = attendanceState.myAttendanceList;
    if (myAttendanceList != null) {
      print("List view is not null");
      return ListView.builder(
        itemCount: myAttendanceList.length,
        itemBuilder: (context, index) {
          final item = myAttendanceList[index];
          return AttendanceDetailItem(entity: item);
        },
      );
    } else if (myAttendanceList != null && attendanceState.failure == null) {
      //IN PROGRESS
      return Center(child: CircularProgressIndicator());
    } else if (attendanceState.failure != null) {
      //FAILURE
      return Center(child: Text("Error Occured"));
    } else {
      return Text("");
    }
  }
}
