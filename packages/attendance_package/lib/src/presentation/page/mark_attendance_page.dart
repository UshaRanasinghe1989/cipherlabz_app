import 'package:attendance_package/src/presentation/widget/map_widget.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class MarkAttendancePageWidget extends StatefulWidget {
  const MarkAttendancePageWidget({super.key});

  @override
  State<MarkAttendancePageWidget> createState() =>
      _MarkAttendancePageWidgetState();
}

class _MarkAttendancePageWidgetState extends State<MarkAttendancePageWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              //BACK
              Align(
                alignment: Alignment(-0.9, 1.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "< Back",
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              //CHILD 2
              SizedBox(height: 20.0),
              //CHILD 3
              Expanded(child: MapWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
