import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class ApplyLeavePage extends StatelessWidget {
  const ApplyLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        //TEXT - LEAVE BALANCE
                        SizedBox(
                          height: 30,
                          child: Container(
                            child: Text(
                              "Leave Balance",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        //CASUAL LEAVE BALANCE CONTAINER
                        _leaveBalanceContainerWidget("Casual Leave", "7"),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(height: 30),
                        //ANNUAL LEAVE BALANCE CONTAINERS
                        _leaveBalanceContainerWidget("Annual Leave", "6"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ApplyLeaveForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //LEAVE BALANCE CONTAINER
  Widget _leaveBalanceContainerWidget(String titleTxt, String leaveBalanceTxt) {
    return Container(
      width: 130,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.blue0085FF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titleTxt, style: _leaveBalanceTextStyle()),
          Text(leaveBalanceTxt, style: _leaveBalanceTextStyle()),
        ],
      ),
    );
  }

  //LEAVE BALANCE TEXT STYLE
  TextStyle _leaveBalanceTextStyle() {
    return TextStyle(
      color: AppColors.white,
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }
}
