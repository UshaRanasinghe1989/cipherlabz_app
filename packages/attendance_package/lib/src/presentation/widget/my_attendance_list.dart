import 'package:attendance_package/src/presentation/widget/attendance_list.dart';
import 'package:flutter/material.dart';

class SuperUserAttendanceListWidget extends StatefulWidget {
  const SuperUserAttendanceListWidget({super.key});

  @override
  State<SuperUserAttendanceListWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SuperUserAttendanceListWidget> {
  @override
  Widget build(BuildContext context) {
    return AttendanceListWidget();
  }
}
