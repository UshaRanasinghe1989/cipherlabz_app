import 'package:flutter/material.dart';

class ProfileImgWidget extends StatefulWidget {
  const ProfileImgWidget({super.key});

  @override
  State<ProfileImgWidget> createState() => _ProfileImgWidgetState();
}

class _ProfileImgWidgetState extends State<ProfileImgWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100), // radius here
      ),
      child: Image.asset("packages/home_package/assets/profile_image.png"),
    );
  }
}
