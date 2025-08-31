import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final String cardValue;
  const CardWidget({
    super.key,
    required this.cardIcon,
    required this.cardText,
    required this.cardValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //shadowColor: AppColors.black00000040,
      elevation: 4,
      color: AppColors.white,
      child: SizedBox(
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(cardIcon, color: AppColors.blue0085FF),
                  SizedBox(width: 10),
                  Text(
                    cardText,
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardValue,
                    style: TextStyle(
                      color: AppColors.blue0051FF,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
