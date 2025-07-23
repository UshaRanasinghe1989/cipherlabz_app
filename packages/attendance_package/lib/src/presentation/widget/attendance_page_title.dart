import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class AttendancePageTitle extends StatelessWidget {
  const AttendancePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pinkE40079),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(25),
          bottomEnd: Radius.circular(25),
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.pinkE40079,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text("Attendance", style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}
