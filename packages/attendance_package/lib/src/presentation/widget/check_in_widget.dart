import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//RESOURCES
import 'package:shared_resources/shared_resources.dart';
import 'package:color_package/color_package.dart';
//PACKAGES
import 'package:login_package/login_package.dart';
import 'package:attendance_package/attendance_package.dart';
//WIDGETS
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class CheckInWidget extends StatelessWidget {
  CheckInWidget({super.key});

  final now = DateTime.now();

  String _currentTime() {
    String formattedTime = DateFormat("hh.mm.ss a").format(now);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 325,
      left: 40,
      right: 40,
      child: Container(
        width: 250,
        height: 150,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColors.black00000040,
          border: Border.all(color: AppColors.blue0085FF),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black00000040, // shadow color
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(
                0,
                4,
              ), // changes position of shadow: x (horizontal), y (vertical)
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                _currentTime(),
                style: TextStyle(
                  fontFamily: AppFonts.inter,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Consumer2<AttendanceProvider, LoginProvider>(
                builder:
                    (
                      BuildContext context,
                      AttendanceProvider provider,
                      LoginProvider LoginProvider,
                      Widget? child,
                    ) {
                      return SwipeButton.expand(
                        thumb: Icon(
                          Icons.arrow_forward,
                          color: AppColors.blue0085FF,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        activeTrackColor: AppColors.blue0085FF,
                        activeThumbColor: AppColors.white,
                        thumbPadding: EdgeInsets.all(5.0),
                        height: 50,
                        child: Text(
                          provider.isCheckedIn
                              ? "Swipe to Check Out"
                              : "Swipe to Check In",
                          style: TextStyle(color: AppColors.white),
                        ),
                        onSwipe: () {
                          final now = DateTime.now();

                          provider.addAttendance(LoginProvider.user!.id, now);
                        },
                      );
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
