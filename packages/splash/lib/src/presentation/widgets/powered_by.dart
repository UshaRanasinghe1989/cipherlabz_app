import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';

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
            color: AppColors.poweredByTextColor,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Image.asset("packages/splash/assets/cipher_labz_logo.png"),
      ],
    );
  }
}
