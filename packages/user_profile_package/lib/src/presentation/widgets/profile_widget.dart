import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_package/user_profile_package.dart';

class ProfileWidget extends StatelessWidget {
  final AsyncValue<UserWithReport> userProfileReportRef;
  const ProfileWidget({super.key, required this.userProfileReportRef});

  @override
  Widget build(BuildContext context) {
    return userProfileReportRef.when(
      data: (state) {
        final user = state.user;
        final report = state.report;

        return Column(
          children: [
            //TEXT - Profile
            Text(
              "Profile",
              style: TextStyle(
                color: AppColors.blue0085FF,
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("packages/home_package/assets/profile_image.png"),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35),
                    Text(
                      user.name,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      user.jobRole,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey6F6F6F,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.department,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey6F6F6F,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.notifications_none,
                    color: AppColors.blue0085FF94,
                    size: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(
                  cardIcon: Icons.person_outline,
                  cardText: "Total Employee`s",
                  cardValue: report.totalEmployees.toString(),
                ),
                CardWidget(
                  cardIcon: Icons.co_present_outlined,
                  cardText: "Total Presents",
                  cardValue: report.totalPresents.toString(),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(
                  cardIcon: Icons.history,
                  cardText: "Total Late",
                  cardValue: report.totalLate.toString(),
                ),
                CardWidget(
                  cardIcon: Icons.door_front_door_outlined,
                  cardText: "Total Leave",
                  cardValue: report.totalPresents.toString(),
                ),
              ],
            ),
          ],
        );
      },

      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text("Error: $err"),
    );
  }
}
