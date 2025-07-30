import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//PACKAGE
import 'package:attendance_package/attendance_package.dart';
//WIDGET
import 'package:home_package/src/presentation/widget/attendance/attendance_time.dart';
import 'current_time.dart';
import 'today.dart';
//RESOURCES
import 'package:shared_resources/shared_resources.dart';
import 'package:color_package/color_package.dart';

class MarkYourAttendanceWidget extends ConsumerWidget {
  const MarkYourAttendanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.read(attendanceProvider).attendance;

    return Container(
      height: 175,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pinkE40079), //#E40079
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DisplayTodayWidget(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.pinkE40079), //#E40079
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: DisplayCurrentTimeWidget(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),

          //NOT CHECKED IN FOR THE DAY
          (attendance == null)
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarkAttendancePageWidget(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pinkE40079,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    elevation: 8, // Controls shadow intensity (default is 2)
                    shadowColor: AppColors.black, // Shadow color
                    padding: EdgeInsets.all(30.0),
                  ),
                  child: Text(
                    'Mark Your Attendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.poppins,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Card(
                  //DISPLAY CHECK IN DETAILS
                  color: AppColors.pinkE40079,
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Clock In",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            AttendanceTimeWidget(field: 'checkIn'),
                          ],
                        ),
                        Text("|", style: TextStyle(color: AppColors.white)),
                        Column(
                          children: [
                            Text(
                              "Clock Out",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            AttendanceTimeWidget(field: "checkOut"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
