import 'package:attendance_package/src/presentation/widget/attendance_list.dart';
import 'package:attendance_package/src/presentation/widget/attendance_page_title.dart';
import 'package:attendance_package/src/presentation/widget/super_user_widgets.dart';
import 'package:color_package/color_package.dart';
import 'package:core/enum/user_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';

class AttendanceDetailPage extends ConsumerWidget {
  const AttendanceDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.read(loginProvider);

    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            AttendancePageTitle(),
            loginState.user!.category == UserCategory.superUser
                ? SuperUserWidgets()
                : AttendanceListWidget(),
          ],
        ),
      ),
    );
  }
}
