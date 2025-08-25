import 'package:color_package/color_package.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:notification_package/notification_package.dart';

class NotificationItemCard extends StatelessWidget {
  final NotificationEntity entity;
  const NotificationItemCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              alignment: Alignment.center,
              child: _getNotificationIcon(entity),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    entity.message,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.grey7C7A82,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                DatetimeHelpers.timeAgo(entity.createdAt),
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.grey7C7A82,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //GET NOTIFICATION ICON
  Icon _getNotificationIcon(NotificationEntity entity) {
    final iconMap = {
      "leave_approved": Icons.check_circle_outline_outlined,
      "leave_rejected": Icons.cancel_outlined,
      "birthday_reminder": Icons.cake_outlined,
    };

    // fallback to a default icon if not found
    final iconData = iconMap[entity.iconName] ?? Icons.notifications;

    return Icon(iconData, color: _getNotificationIconColor(iconData));
  }

  //NOTIFICATION ICON COLOR
  Color _getNotificationIconColor(IconData icon) {
    if (icon == Icons.check_circle_outline_outlined) {
      return AppColors.green00BC61; //#00BC61
    } else if (icon == Icons.cancel_outlined) {
      return AppColors.red; //#FF0000
    } else if (icon == Icons.cake_outlined) {
      return AppColors.red; //#FF0000
    } else {
      return AppColors.black;
    }
  }
}
