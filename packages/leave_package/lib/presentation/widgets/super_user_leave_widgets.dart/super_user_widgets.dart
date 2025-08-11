import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';

class SuperUserLeaveWidgets extends ConsumerStatefulWidget {
  const SuperUserLeaveWidgets({super.key});

  @override
  ConsumerState<SuperUserLeaveWidgets> createState() =>
      _SuperUserLeaveWidgetsState();
}

class _SuperUserLeaveWidgetsState extends ConsumerState<SuperUserLeaveWidgets> {
  bool isSelectedMyLeave = true;
  bool isSelectedEmpLeave = false;

  Widget getMyLeaveList() {
    return Column(
      children: [
        Center(child: ApplyLeaveBtn()),
        SizedBox(height: 5),
        SizedBox(height: 250, child: MyLeaveUsageWidget()),
        SizedBox(height: 5),
        Expanded(child: MyLeaveRequests()),
      ],
    );
  }

  Widget getEmployeeLeaveList() {
    return Expanded(child: PendingLeaveRequestsContainer());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        color: AppColors.white,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // height:
        //     MediaQuery.of(context).size.height -
        //     MediaQuery.of(context).padding.vertical,
        child: Column(
          children: [
            //PAGE TITLE
            LeavePageTitle(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //MY LEAVE BUTTON
                SizedBox(
                  width: 150,
                  child: LeaveDetailsBtn(
                    buttonText: "My Leave",
                    btnKey: "my_leave",
                    isSelected: isSelectedMyLeave,
                    onTap: () {
                      setState(() {
                        isSelectedMyLeave = true;
                        isSelectedEmpLeave = false;
                        getMyLeaveList();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MyLeavePage(),
                        //   ),
                        // );
                      });
                    },
                  ),
                ),
                SizedBox(width: 5),
                //EMPLOYEE LEAVE BUTTON
                SizedBox(
                  width: 150,
                  child: LeaveDetailsBtn(
                    buttonText: "Employee Leave",
                    btnKey: "emp_leave",
                    isSelected: isSelectedEmpLeave,
                    onTap: () {
                      setState(() {
                        isSelectedMyLeave = false;
                        isSelectedEmpLeave = true;
                        getEmployeeLeaveList();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            isSelectedEmpLeave
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LeaveRequestCountsContainer(
                        borderColor: AppColors.blue0085FF,
                        containerTitle: "Total Requests",
                        count: 15,
                      ),
                      SizedBox(width: 5),
                      LeaveRequestCountsContainer(
                        borderColor: AppColors.yellowF0C083,
                        containerTitle: "Pending",
                        count: 5,
                      ),
                      SizedBox(width: 5),
                      LeaveRequestCountsContainer(
                        borderColor: AppColors.pinkE40079,
                        containerTitle: "Rejected",
                        count: 15,
                      ),
                    ],
                  )
                : SizedBox(height: 5, child: Text("")),
            Expanded(
              child: isSelectedMyLeave
                  ? getMyLeaveList()
                  : getEmployeeLeaveList(),
            ),
          ],
        ),
      ),
    );
  }
}
