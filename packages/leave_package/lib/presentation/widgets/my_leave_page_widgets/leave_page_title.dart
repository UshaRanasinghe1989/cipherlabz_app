import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class LeavePageTitle extends StatelessWidget {
  const LeavePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue0085FF), //#0085FF
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(25),
          bottomEnd: Radius.circular(25),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 125,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.blue0085FF, //#0085FF
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text("Leave", style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}
