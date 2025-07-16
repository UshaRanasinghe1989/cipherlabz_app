import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';

class LoginPageTitleWidget extends StatelessWidget {
  const LoginPageTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      //PAGE TITLE
      "Welcome Back",
      style: TextStyle(
        fontFamily: "Poppins",
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
