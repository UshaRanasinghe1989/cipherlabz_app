import 'package:flutter/material.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_package/src/presentation/widget/todays_schedule/schedule_item.dart';
import 'package:schedule_package/schedule_package.dart';
import 'package:shared_resources/shared_resources.dart';

class TodaysScheduleWidget extends ConsumerWidget {
  final double hoizontalBodyMargin;

  const TodaysScheduleWidget({super.key, required this.hoizontalBodyMargin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Schedule it to run after build:
    Future.microtask(
      () => ref
          .read(scheduleProvider.notifier)
          .getSchedule(today: DateTime.now()),
    );

    final scheduleState = ref.watch(scheduleProvider);
    final scheduleList = scheduleState.scheduleList;

    if (scheduleList != null) {
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
                  itemCount: scheduleList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: ScheduleItemWidget(
                        scheduleEntity: scheduleList[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else if (scheduleList != null && scheduleState.failure == null) {
      //IN PROGRESS
      return Center(child: CircularProgressIndicator());
    } else if (scheduleState.failure != null) {
      //FAILURE
      return Center(child: Text(scheduleState.failure.toString()));
    } else {
      return Text("");
    }
  }
}
