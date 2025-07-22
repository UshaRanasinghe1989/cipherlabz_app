import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//PACKAGES
import 'package:attendance_package/attendance_package.dart';
import 'package:login_package/login_package.dart';
//WIDGETS
import 'package:home_package/src/presentation/widget/top_row/profile_img.dart';
import 'package:shared_resources/shared_resources.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AttendanceProvider>().isCheckedInProvider(user!.id);
    });
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
                          ? "Hello ${user!.name.trim().split(' ').first} 👋"
                          : "Good morning ${user!.name.trim().split(' ').first} 👋",
                      style: TextStyle(
                        fontFamily: AppFonts.ls,
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: AppColors.black,
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
