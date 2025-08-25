import 'package:flutter/material.dart';
//PACKAGES
import 'package:home_package/src/presentation/widget/announcements/announcements.dart';
import 'package:home_package/src/presentation/widget/attendance/attendance_mark.dart';
import 'package:home_package/src/presentation/widget/todays_schedule/todays_schedule.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  final double hoizontalBodyMargin = 20.0;
  final double topBodyMargin = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            //CHILD 1
            Container(color: Colors.white),
            //ATTENDANCE
            AttendanceMarkWidget(
              hoizontalBodyMargin: hoizontalBodyMargin,
              topBodyMargin: topBodyMargin,
            ),
            //TODAYS`S SCHEDULE
            TodaysScheduleWidget(hoizontalBodyMargin: hoizontalBodyMargin),
            //ANNOUNCEMENTS
            AnnouncementsWidget(hoizontalBodyMargin: hoizontalBodyMargin),
          ],
        ),
      ),
    );
  }
}
