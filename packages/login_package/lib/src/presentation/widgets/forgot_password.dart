import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigate to Forgot Password screen or handle logic
        print('Forgot password tapped!');
      },
      child: Text(
        'Forgot Password',
        style: TextStyle(
          color: AppColors.blue001645, //#001645
          fontFamily: AppFonts.poppins,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
