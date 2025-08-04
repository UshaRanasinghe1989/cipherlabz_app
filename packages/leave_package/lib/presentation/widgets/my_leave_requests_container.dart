import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';
import 'package:leave_package/presentation/widgets/my_leave_requests_title%20.dart';

class MyLeaveRequests extends StatefulWidget {
  const MyLeaveRequests({super.key});

  @override
  State<MyLeaveRequests> createState() => _MyLeaveRequestsState();
}

class _MyLeaveRequestsState extends State<MyLeaveRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [MyLeaveRequestsTitle(), MyLeaveRequestsList()]),
    );
  }
}
