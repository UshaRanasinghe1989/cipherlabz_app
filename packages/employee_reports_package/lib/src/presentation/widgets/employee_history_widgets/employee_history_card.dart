import 'package:color_package/color_package.dart';
import 'package:core/core.dart';
import 'package:core/helpers/datetime_helpers.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class EmployeeHistoryCard extends StatelessWidget {
  final SubordinateReport report;
  const EmployeeHistoryCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: AppColors.blue0085FF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                //PROFILE IMAGE
                Image.asset(
                  "packages/employee_reports_package/assets/profile_image.png",
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //EMPLOYEE NAME
                    Text(
                      report.subordinateObj.name,
                      style: TextStyle(
                        color: AppColors.blue0085FF,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    //EMPLOYEE JOB ROLE
                    Text(
                      report.subordinateObj.jobRole,
                      style: TextStyle(
                        color: AppColors.grey3F3D56,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: AppColors.greyCBCBCBB0), //#CBCBCBB0
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TEXT - Leave
                    Text(
                      "Leave",
                      style: TextStyle(
                        color: AppColors.blue0085FF,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    //LEAVE DAYS TAKEN - COUNT
                    Text(
                      "${_leaveCount(report)} days taken",
                      style: TextStyle(
                        color: AppColors.grey3F3D56,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    //LAST LEAVE DATE
                    Text(
                      "Last leave : ${_getLastLeaveDate(report)}",
                      style: TextStyle(
                        color: AppColors.grey3F3D56,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: AppColors.greyCBCBCBB0,
                    thickness: 2,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TEXT - Attendance
                    Text(
                      "Attendance",
                      style: TextStyle(
                        color: AppColors.blue0085FF,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    //ATTENDANCE PERCENTAGE
                    Text(
                      _attendancePercentage(report),
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //GET LEAVE COUNT
  String _leaveCount(SubordinateReport report) {
    return report.subordinateLeaveRequestsList.length.toString();
  }

  //GET ATTENDANCE PERCENTAGE
  String _attendancePercentage(SubordinateReport report) {
    DateTime today = DateTime.now();
    //GET HOLIDAYS LIST
    final holidays = HolidaysList.holidaysList;
    //TOTAL WORKING DAYS FROM JANUARY 1ST TO TODAY
    int totalWorkingDays = CalendarHelper.getWorkingDays(
      DateTime(today.year, 1, 1),
      today,
      holidays,
    );
    //ATTENDANCE COUNT
    int subordinateAttendanceCount = report.subordinateAttendanceList.length;
    //ATTENDANCE AS A PERCENTAGE
    double attendanceAsPercentage =
        (subordinateAttendanceCount * 100) / totalWorkingDays;
    //RESULT ROUNDED TO 2 DECIMAL PLACES
    double roundedResult = double.parse(
      attendanceAsPercentage.toStringAsFixed(1),
    );

    return "$roundedResult%";
  }

  String _getLastLeaveDate(SubordinateReport report) {
    DateTime today = DateTime.now();

    //PAST LEAVES LIST
    final pastLeaves = report.subordinateLeaveRequestsList
        .where((leave) => leave.toDate.isBefore(today))
        .toList();

    //SORT BY DATE DECENDING
    pastLeaves.sort((a, b) => b.toDate.compareTo(a.toDate));

    //GET THE LATEST LEAVE TAKEN DATE
    if (pastLeaves.isNotEmpty) {
      DateTime lastLeaveDate = pastLeaves.first.toDate;
      return DatetimeHelpers.monthDate(lastLeaveDate);
    } else {
      return "N/A";
    }
  }
}
