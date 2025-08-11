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
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //PAGE TITLE
              //IgnorePointer(child: LeavePageTitle()),
              LeavePageTitle(),
              //ADD LEAVE BUTTON
              // Positioned(
              //   top: 50,
              //   left: MediaQuery.of(context).size.width / 2 - 90,
              //   child: Center(child: ApplyLeaveBtn()),
              // ),
              Center(child: ApplyLeaveBtn()),
              SizedBox(height: 10),
              SizedBox(height: 250, child: MyLeaveUsageWidget()),
              SizedBox(height: 20),
              SizedBox(height: 200, child: MyLeaveRequests()),
            ],
          ),
        ),
      ),
    );
  }
}
