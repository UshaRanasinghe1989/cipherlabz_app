import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class MyLeaveUsageTitle extends StatelessWidget {
  const MyLeaveUsageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "My Leave Usage",
      style: TextStyle(
        color: AppColors.blue0590DF, //#0590DF
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}
