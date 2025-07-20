import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powered by",
          style: TextStyle(
            color: AppColors.gray7C7A82, //#7C7A82
            fontFamily: AppFonts.poppins,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Image.asset("packages/splash/assets/cipher_labz_logo.png"),
      ],
    );
  }
}
