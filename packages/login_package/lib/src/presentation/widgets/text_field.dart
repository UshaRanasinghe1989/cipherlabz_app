import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';

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
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor,
          ),
          filled: true,
          fillColor: AppColors.textFieldFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(textFormFieldRadius, textFormFieldRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldFillColor,
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
