import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class MyLeaveRequestsTitle extends StatelessWidget {
  const MyLeaveRequestsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
      alignment: Alignment.topLeft,
      child: const Text(
        "My Leave Requests",
        style: TextStyle(
          color: AppColors.black, //#0590DF
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}
