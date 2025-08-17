import 'package:color_package/color_package.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter/material.dart';

class EmployeeHistoryPage extends StatelessWidget {
  const EmployeeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              // < BACK
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
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
              ),
              SizedBox(height: 10),
              Text(
                "Employees History",
                style: TextStyle(
                  color: AppColors.blue0590DF,
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              EmployeeHistoryListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
