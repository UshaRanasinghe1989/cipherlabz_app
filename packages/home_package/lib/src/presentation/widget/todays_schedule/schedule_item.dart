import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';
//PACKAGES
import 'package:schedule_package/schedule_package.dart';

class ScheduleItemWidget extends StatelessWidget {
  final ScheduleEntity scheduleEntity;

  const ScheduleItemWidget({super.key, required this.scheduleEntity});

  String formatTime(DateTime time) {
    return DateFormat('hh.mm a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shadowColor: AppColors.black00000040,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.0),
        side: BorderSide(color: AppColors.white, width: 1),
      ),
      elevation: 8,
      //height: 50,
      // decoration: BoxDecoration(
      //   color: scheduleItemBackgroundColor,
      //   boxShadow: [
      //     BoxShadow(
      //       color: dropShadowColor, // Shadow color
      //       spreadRadius: 0.0, // How much the shadow spreads
      //       blurRadius: 8.0, // How soft the shadow is
      //       offset: Offset(0.0, 4.0), // Horizontal and vertical offset
      //     ), //BoxShadow
      //     BoxShadow(
      //       color: Colors.white,
      //       offset: const Offset(0.0, 0.0),
      //       blurRadius: 0.0,
      //       spreadRadius: 0.0,
      //     ),
      //   ],
      // ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(scheduleEntity.imagePath),
            Column(
              children: [
                Text(
                  scheduleEntity.description,
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${formatTime(scheduleEntity.fromTime)} - ${formatTime(scheduleEntity.toTime)}',
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Icon(Icons.more_vert), // vertical dots (kebab)//PopupMenuButton
          ],
        ),
      ),
    );
  }
}
