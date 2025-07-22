import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:intl/intl.dart';
import 'package:shared_resources/shared_resources.dart';

class DisplayTodayWidget extends StatelessWidget {
  const DisplayTodayWidget({super.key});

  String _getToday() {
    String formattedDate = DateFormat(
      "EEEE, d MMM yyyy",
    ).format(DateTime.now());
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getToday(),
      style: TextStyle(
        fontFamily: AppFonts.poppins,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.pinkE40079, //#E40079
      ),
    );
  }
}
