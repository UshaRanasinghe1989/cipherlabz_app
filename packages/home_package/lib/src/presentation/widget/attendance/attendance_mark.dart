import 'package:flutter/material.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:home_package/src/presentation/widget/top_row/top_row.dart';
import 'package:shared_resources/shared_resources.dart';
//WIDGETS
import 'mark_your_attendance.dart';

class AttendanceMarkWidget extends StatelessWidget {
  final double hoizontalBodyMargin;
  final double topBodyMargin;

  const AttendanceMarkWidget({
    super.key,
    required this.hoizontalBodyMargin,
    required this.topBodyMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      decoration: BoxDecoration(
        color: AppColors.pinkE400790F, //#E4007930
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: hoizontalBodyMargin,
          right: hoizontalBodyMargin,
          top: topBodyMargin,
        ),
        child: Column(
          children: [
            //CHILD 1
            TopRowWidget(),
            //CHILD 2
            SizedBox(height: 10),
            //CHILD 3
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Overview",
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            //CHILD 4
            SizedBox(height: 10),
            //CHILD 5
            MarkYourAttendanceWidget(),
            //CHILD 6
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
