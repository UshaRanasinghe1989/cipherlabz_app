import 'package:flutter/material.dart';
import 'package:leave_package/presentation/widgets/my_leave_requests_title%20.dart';

class MyLeaveRequests extends StatelessWidget {
  const MyLeaveRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyLeaveRequestsTitle(),
          SingleChildScrollView(scrollDirection: Axis.vertical),
        ],
      ),
    );
  }
}
