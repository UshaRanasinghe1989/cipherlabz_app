import 'package:flutter/material.dart';

class LoginPageImageWidget extends StatelessWidget {
  final String imagePath;
  const LoginPageImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}