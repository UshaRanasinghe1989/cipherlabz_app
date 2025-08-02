import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:leave_package/leave_package.dart';

class MyLeavePage extends StatelessWidget {
  const MyLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            //PAGE TITLE & ADD LEAVE BUTTON
            Stack(
              clipBehavior: Clip.none,
              children: [
                //PAGE TITLE
                IgnorePointer(child: LeavePageTitle()),
                //ADD LEAVE BUTTON
                Positioned(
                  top: 50,
                  left: MediaQuery.of(context).size.width / 2 - 90,
                  child: Center(child: ApplyLeaveBtn()),
                ),
              ],
            ),
            MyLeaveUsageWidget(),
            MyLeaveRequests(),
          ],
        ),
      ),
    );
  }
}
