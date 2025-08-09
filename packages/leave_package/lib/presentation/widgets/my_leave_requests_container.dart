import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class MyLeaveRequests extends StatefulWidget {
  const MyLeaveRequests({super.key});

  @override
  State<MyLeaveRequests> createState() => _MyLeaveRequestsState();
}

class _MyLeaveRequestsState extends State<MyLeaveRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(children: [MyLeaveRequestsTitle(), MyLeaveRequestsList()]),
    );
  }
}
