import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class LeaveRequestCountsContainer extends StatelessWidget {
  final borderColor;
  final String containerTitle;
  final int count;
  const LeaveRequestCountsContainer({
    super.key,
    required this.borderColor,
    required this.containerTitle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            containerTitle,
            style: TextStyle(
              color: AppColors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 5),
          Text(
            count.toString(),
            style: TextStyle(
              color: borderColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
