import 'package:announcement_package/announcement_package.dart';
import 'package:flutter/material.dart';
//RESOURCES
import 'package:color_package/color_package.dart';

class AnnouncementItemWidget extends StatelessWidget {
  final AnnouncementEntity announcement;

  const AnnouncementItemWidget({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blue0085FF, //#0085FF
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20.0),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(announcement.description),
      ),
    );
  }
}
