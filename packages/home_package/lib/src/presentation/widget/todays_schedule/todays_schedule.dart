import 'package:flutter/material.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:home_package/src/presentation/widget/todays_schedule/schedule_item.dart';
import 'package:provider/provider.dart';
import 'package:schedule_package/schedule_package.dart';
import 'package:shared_resources/shared_resources.dart';

class TodaysScheduleWidget extends StatelessWidget {
  final double hoizontalBodyMargin;

  const TodaysScheduleWidget({super.key, required this.hoizontalBodyMargin});

  @override
  Widget build(BuildContext context) {
    // Triggers only once after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ScheduleProvider>(
        context,
        listen: false,
      ).eitherFailureOrSchedule();
    });

    return Positioned(
      top: 300,
      left: hoizontalBodyMargin,
      right: hoizontalBodyMargin,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.black00000040, // shadow color
              spreadRadius: 1, // how wide the shadow spreads
              blurRadius: 2, // how soft the shadow is
              offset: Offset(0, 4), // horizontal (x), vertical (y)
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                "What`s Up Today",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.poppins,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<ScheduleProvider>(
                  context,
                ).scheduleList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: ScheduleItemWidget(
                      scheduleEntity: Provider.of<ScheduleProvider>(
                        context,
                      ).scheduleList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
