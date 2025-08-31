import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';
import 'package:user_profile_package/user_profile_package.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileReportRef = ref.watch(userProfileAsyncNotifierProvider);
    //final userAsync = ref.watch(userAsyncNotifierProvider);

    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ProfileWidget(userProfileReportRef: userProfileReportRef),
        ),
      ),
    );
  }
}
