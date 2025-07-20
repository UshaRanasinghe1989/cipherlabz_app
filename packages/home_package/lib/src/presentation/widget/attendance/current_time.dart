import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_resources/shared_resources.dart';

class DisplayCurrentTimeWidget extends StatefulWidget {
  const DisplayCurrentTimeWidget({super.key});

  @override
  State<DisplayCurrentTimeWidget> createState() =>
      _DisplayCurrentTimeWidgetState();
}

class _DisplayCurrentTimeWidgetState extends State<DisplayCurrentTimeWidget> {
  String _currentTime() {
    String formattedTime = DateFormat("hh.mm a").format(DateTime.now());
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Text(
        _currentTime(),
        style: TextStyle(
          fontFamily: AppFonts.poppins,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.pinkE40079,
        ),
      ),
    );
  }
}
