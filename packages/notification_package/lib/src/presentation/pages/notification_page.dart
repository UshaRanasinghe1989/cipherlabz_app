import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:notification_package/notification_package.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              //TEXT - Notification
              Text(
                "Notification",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              // < BACK
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "< Back",
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              NotificationListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
