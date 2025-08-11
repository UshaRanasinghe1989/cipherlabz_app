import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';

class EmployeeLeaveListWidget extends ConsumerStatefulWidget {
  const EmployeeLeaveListWidget({super.key});

  @override
  ConsumerState<EmployeeLeaveListWidget> createState() =>
      _EmployeeLeaveListWidgetState();
}

class _EmployeeLeaveListWidgetState
    extends ConsumerState<EmployeeLeaveListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loginState = ref.read(loginProvider);
      final user = loginState.user;

      if (user != null) {
        final superiorId = user.id;
        ref
            .read(attendanceProvider.notifier)
            .getEmployeeAttendanceList(superiorId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //REFER ATTENDANCE STATE
    final attendanceState = ref.watch(attendanceProvider);
    final empAttendanceList = attendanceState.employeeAttendanceList;

    if (empAttendanceList != null && empAttendanceList.isNotEmpty) {
      return ListView.builder(
        itemCount: empAttendanceList.length,
        itemBuilder: (context, index) {
          final item = empAttendanceList[index];
          return EmployeeAttendanceDetailItem(entity: item);
        },
      );
    } else if (attendanceState.isLoading == true &&
        attendanceState.failure == null) {
      //IN PROGRESS
      return Center(child: CircularProgressIndicator());
    } else if (attendanceState.failure != null) {
      //FAILURE
      return Center(child: Text(attendanceState.failure.toString()));
    } else {
      return const Center(
        child: Text("No employee attendance data available."),
      );
    }
  }
}
