import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeAttendanceListWidget extends StatefulWidget {
  const EmployeeAttendanceListWidget({super.key});

  @override
  State<EmployeeAttendanceListWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EmployeeAttendanceListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AttendanceProvider>(
        builder: (BuildContext context, AttendanceProvider provider, _) {
          if (provider.attendanceList.isEmpty && provider.failure == null) {
            //IN PROGRESS
            return Center(child: CircularProgressIndicator());
          } else if (provider.failure != null) {
            //FAILURE
            return Center(child: Text(provider.failure.toString()));
          } else {
            return ListView.builder(
              itemCount: provider.attendanceList.length,
              itemBuilder: (context, index) {
                final item = provider.attendanceList[index];
                //return AttendanceDetailItem(entity: item);
              },
            );
          }
        },
      ),
    );
  }
}
