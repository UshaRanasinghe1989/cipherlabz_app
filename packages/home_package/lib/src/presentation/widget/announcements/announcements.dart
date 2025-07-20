import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';
//PACKAGES
import 'package:announcement_package/announcement_package.dart';
//WIDGET
import 'package:home_package/src/presentation/widget/announcements/announcement_item.dart';

class AnnouncementsWidget extends StatelessWidget {
  final double hoizontalBodyMargin;

  const AnnouncementsWidget({super.key, required this.hoizontalBodyMargin});

  @override
  Widget build(BuildContext context) {
    // Triggers only once after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnnouncementProvider>(
        context,
        listen: false,
      ).eitherFailureOrAnnouncement();
    });

    return Positioned(
      top: 520,
      left: hoizontalBodyMargin,
      right: hoizontalBodyMargin,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.blue0085FF, width: 1.5), //#0085FF
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Company Announcements 📢",
                    style: TextStyle(
                      color: AppColors.blue0085FF, //#0085FF
                      fontFamily: AppFonts.inter,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //Image(image: image)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<AnnouncementProvider>(
                  context,
                ).announcementList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: AnnouncementItemWidget(
                      announcement: Provider.of<AnnouncementProvider>(
                        context,
                      ).announcementList[index],
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
