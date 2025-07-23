import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class AttendanceDetailsBtn extends StatelessWidget {
  final String buttonText;
  final String btnKey;
  final bool isSelected;
  final VoidCallback onTap;

  AttendanceDetailsBtn({
    super.key,
    required this.buttonText,
    required this.btnKey,
    required this.isSelected,
    required this.onTap,
  });

  // WidgetStateProperty<Color?> getSelectedBackgroundColor() {
  Color getBackgroundColor() {
    return isSelected ? AppColors.blue0590DF : AppColors.greyE9D4D563;
  }

  Color getFontColor() {
    return isSelected ? AppColors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: Key(btnKey),
        onPressed: onTap,
        style: ButtonStyle(
          //minimumSize: WidgetStateProperty.all(Size(25, 40)),
          //padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
          backgroundColor: WidgetStateProperty.all(getBackgroundColor()),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: getFontColor(),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
