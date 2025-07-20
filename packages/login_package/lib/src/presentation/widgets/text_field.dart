import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String customHintText;
  final String msg;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.customHintText,
    required this.msg,
  });

  final double textFormFieldWidth = 300.0;

  final double textFormFieldRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textFormFieldWidth,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: customHintText,
          hintStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.grey00000070, //#00000070
          ),
          filled: true,
          fillColor: AppColors.whiteFFFAFA, //#FFFAFA
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(textFormFieldRadius, textFormFieldRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.whiteFFFAFA, //#FFFAFA
              width: 1,
            ),
            borderRadius: BorderRadius.circular(textFormFieldRadius),
          ),
        ),
        textAlign: TextAlign.center,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return msg;
          }
          return null;
        },
      ),
    );
  }
}
