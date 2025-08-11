import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LeaveDonutChart extends StatelessWidget {
  final String centerText;
  final List<PieChartSectionData> buildSectionsList;
  const LeaveDonutChart({
    super.key,
    required this.centerText,
    required this.buildSectionsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Center(child: Text(centerText)),
          PieChart(
            PieChartData(
              centerSpaceRadius: 30, // this creates the "donut" hole
              sectionsSpace: 0, // space between sections
              sections: buildSectionsList,
            ),
          ),
        ],
      ),
    );
  }
}
