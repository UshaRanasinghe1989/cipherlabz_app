import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_resources/shared_resources.dart';
import 'package:color_package/color_package.dart';
import 'current_time.dart';
import 'today.dart';

class MarkYourAttendanceWidget extends StatelessWidget {
  const MarkYourAttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          Consumer<AttendanceProvider>(
            builder:
                (
                  BuildContext context,
                  AttendanceProvider provider,
                  Widget? child,
                ) {
                  //NOT CHECKED IN FOR THE DAY
                  return (!provider.isCheckedIn)
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MarkAttendancePageWidget(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.pinkE40079,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            elevation:
                                8, // Controls shadow intensity (default is 2)
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
                                    Text(
                                      DateFormat("hh.mm a").format(
                                        provider.getAttendanceObj(0)!.checkIn,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: AppFonts.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(color: AppColors.white),
                                ),
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
                                    Text(
                                      provider.getAttendanceObj(0)?.checkOut !=
                                              null
                                          ? DateFormat("hh.mm a").format(
                                              provider
                                                  .getAttendanceObj(0)!
                                                  .checkOut,
                                            )
                                          : DateFormat("hh.mm a").format(
                                              provider
                                                  .getAttendanceObj(0)!
                                                  .checkIn,
                                            ),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: AppFonts.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                },
          ),
        ],
      ),
    );
  }
}
