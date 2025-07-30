import 'package:attendance_package/attendance_package.dart';
import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuperUserWidgets extends ConsumerStatefulWidget {
  const SuperUserWidgets({super.key});

  @override
  ConsumerState<SuperUserWidgets> createState() => _SuperUserWidgetsState();
}

class _SuperUserWidgetsState extends ConsumerState<SuperUserWidgets> {
  bool isSelectedMyAttendance = true;
  bool isSelectedEmpAttendance = false;

  Widget getMyAttendanceList() {
    return AttendanceDetailPage();
  }

  Widget getEmployeeAttendanceList() {
    return EmployeeAttendanceListWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            //PAGE TITLE
            AttendancePageTitle(),
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
                      getMyAttendanceList();
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
                      getEmployeeAttendanceList();
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
            SizedBox(height: 20),
            Expanded(
              child: isSelectedMyAttendance
                  ? SuperUserAttendanceListWidget()
                  : EmployeeAttendanceListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
