import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/presentation/pages/apply_leave_page.dart';

class ApplyLeaveBtn extends StatelessWidget {
  const ApplyLeaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _onPressedApplyLeaveBtn(context),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.green00A354),
        ),
        elevation: 20,
        shadowColor: AppColors.black00000040, //#00000040
      ),
      child: SizedBox(
        height: 40,
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: AppColors.green00A354,
              size: 30,
            ),
            Text(
              "Apply Leave",
              style: TextStyle(
                color: AppColors.green00A354,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //WHEN PRESS APPLY LEAVE BUTTON
  void _onPressedApplyLeaveBtn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ApplyLeavePage()),
    );
  }
}
