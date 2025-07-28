import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//PACKAGES
import 'package:login_package/login_package.dart';
//WIDGETS
import 'package:home_package/src/presentation/widget/top_row/profile_img.dart';
import 'package:shared_resources/shared_resources.dart';
//APP COLORS
import 'package:color_package/color_package.dart';

class TopRowWidget extends ConsumerWidget {
  const TopRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //GET LOGIN STATE
    final loginState = ref.watch(loginProvider);

    final userId = loginState.user!.id;
    final userName = loginState.user!.name;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileImgWidget(),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            child: Text(
              maxLines: 1,
              AttendanceHelper.isCheckedIn(userId)
                  ? "Hello ${userName.trim().split(' ').first} 👋"
                  : "Good morning ${userName.trim().split(' ').first} 👋",
              style: TextStyle(
                fontFamily: AppFonts.ls,
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.notification_add_outlined,
            color: AppColors.blue0085FF,
          ), //Color(0XFF0085FF)),
        ),
      ],
    );
  }
}
