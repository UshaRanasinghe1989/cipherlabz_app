import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class DonutChartLabel extends StatelessWidget {
  final String chartLabelText;
  const DonutChartLabel({super.key, required this.chartLabelText});

  @override
  Widget build(BuildContext context) {
    return Text(
      chartLabelText,
      style: TextStyle(
        color: AppColors.pinkE40079,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
