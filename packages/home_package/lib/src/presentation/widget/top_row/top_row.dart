import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//PACKAGES
import 'package:attendance_package/attendance_package.dart';
import 'package:login_package/login_package.dart';
//WIDGETS
import 'package:home_package/src/presentation/widget/top_row/profile_img.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileImgWidget(),
        Consumer2<AttendanceProvider, LoginProvider>(
          builder:
              (
                BuildContext context,
                AttendanceProvider attendanceProvider,
                LoginProvider loginProvider,
                Widget? child,
              ) {
                return Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      maxLines: 1,
                      attendanceProvider.isCheckedIn
                          ? "Hello ${loginProvider.user!.name.trim().split(' ').first} 👋"
                          : "Good morning ${loginProvider.user!.name.trim().split(' ').first} 👋",
                      style: TextStyle(
                        fontFamily: "Londrina Solid",
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.notification_add_outlined, color: Color(0XFF0085FF)),
        ),
      ],
    );
  }
}
