import 'package:color_package/color_package.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:leave_package/leave_package.dart';

class MyLeaveUsageWidget extends StatelessWidget {
  const MyLeaveUsageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //MY LEAVE USAGE CONTAINER
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.pinkE40079), //#E40079
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.black00000040,
            offset: Offset.zero,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      //MY LEAVE USAGE CONTENT
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //TITLE - MY LEAVE USAGE
          MyLeaveUsageTitle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //DONUT CHART - APPLIED LEAVES
              LeaveDonutChart(
                centerText: "2",
                buildSectionsList: buildSections(),
              ),
              SizedBox(width: 5),
              //DONUT CHART - MONTHLY LEAVES
              LeaveDonutChart(
                centerText: "5",
                buildSectionsList: buildSections(),
              ),
              SizedBox(width: 5),
              //DONUT CHART - ANNUAL LEAVES
              LeaveDonutChart(
                centerText: "10",
                buildSectionsList: buildSections(),
              ),
            ],
          ),
          //DONUT CHART LABELS CONTAINER
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue0085FF), //#0085FF
              borderRadius: BorderRadius.circular(15),
            ),
            //DONUT CHART LABELS
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DonutChartLabel(chartLabelText: "Applied Leaves"),
                DonutChartLabel(chartLabelText: "Monthly Leaves"),
                DonutChartLabel(chartLabelText: "Annual Leaves"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> buildSections() {
    return [
      PieChartSectionData(
        value: 30,
        color: AppColors.blue0090FF, //#0090FF
        radius: 20,
        titleStyle: TextStyle(fontSize: 16, color: Colors.white),
        showTitle: false,
      ),
      PieChartSectionData(
        value: 70,
        color: AppColors.blue94D7FC, //#94D7FC
        radius: 20,
        titleStyle: TextStyle(fontSize: 16, color: Colors.white),
        showTitle: false,
      ),
    ];
  }
}
