import 'package:attendance_package/src/presentation/widget/attendance_list.dart';
import 'package:attendance_package/src/presentation/widget/attendance_page_title.dart';
import 'package:attendance_package/src/presentation/widget/super_user_widgets.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:login_package/login_package.dart';
import 'package:provider/provider.dart';

class AttendanceDetailPage extends StatelessWidget {
  const AttendanceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Consumer<LoginProvider>(
          builder:
              (BuildContext context, LoginProvider provider, Widget? child) {
                return Column(
                  children: [
                    AttendancePageTitle(),
                    user!.category == UserCategory.superUser
                        ? SuperUserWidgets()
                        : Text(""),
                    AttendanceListWidget(),
                  ],
                );
              },
        ),
      ),
    );
  }
}
