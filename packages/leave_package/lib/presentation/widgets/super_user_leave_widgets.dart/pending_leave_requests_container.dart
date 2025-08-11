import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class PendingLeaveRequestsContainer extends StatefulWidget {
  const PendingLeaveRequestsContainer({super.key});

  @override
  State<PendingLeaveRequestsContainer> createState() =>
      _PendingLeaveRequestsContainerState();
}

class _PendingLeaveRequestsContainerState
    extends State<PendingLeaveRequestsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Pending Leave Requests",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
        ),
        SizedBox(height: 5),
        Expanded(child: PendingLeaveRequestsList()),
      ],
    );
  }
}
