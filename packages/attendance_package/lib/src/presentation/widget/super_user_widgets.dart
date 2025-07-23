import 'package:attendance_package/src/presentation/widget/attendance_details_btn.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class SuperUserWidgets extends StatefulWidget {
  const SuperUserWidgets({super.key});

  @override
  State<SuperUserWidgets> createState() => _SuperUserWidgetsState();
}

class _SuperUserWidgetsState extends State<SuperUserWidgets> {
  bool isSelectedMyAttendance = true;
  bool isSelectedEmpAttendance = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //MY ATTENDANCE BUTTON
              AttendanceDetailsBtn(
                buttonText: "My Attendance",
                btnKey: "my_attendance",
                isSelected: isSelectedMyAttendance,
                onTap: () {
                  setState(() {
                    isSelectedMyAttendance = true;
                    isSelectedEmpAttendance = false;
                  });
                },
              ),
              SizedBox(width: 5),
              //EMPLOYEE ATTENDANCE BUTTON
              AttendanceDetailsBtn(
                buttonText: "Employee Attendance",
                btnKey: "emp_attendance",
                isSelected: isSelectedEmpAttendance,
                onTap: () {
                  setState(() {
                    isSelectedMyAttendance = false;
                    isSelectedEmpAttendance = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          //EMPLOYEE HISTORY BUTTON
          Container(
            width: 250,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue0590DF),
              borderRadius: BorderRadius.circular(23),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black00000040,
                  blurRadius: 5,
                  offset: Offset(0, 4), // x, y
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 1,
                  offset: Offset(0, 0), // x, y
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: AppColors.blue0590DF,
                  ),
                ),
                Text(
                  "Employees History",
                  style: TextStyle(
                    color: AppColors.blue0590DF,
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
