import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter/material.dart';

class EmployeeHistoryCard extends StatelessWidget {
  final SubordinateReport report;
  const EmployeeHistoryCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(report.subordinateObj.name),
          Text(_leaveCount(report)),
          Text(_attendanceCount(report)),
        ],
      ),
    );
  }

  String _leaveCount(SubordinateReport report) {
    return report.subordinateLeaveRequestsList.length.toString();
  }

  String _attendanceCount(SubordinateReport report) {
    return report.subordinateAttendanceList.length.toString();
  }
}
