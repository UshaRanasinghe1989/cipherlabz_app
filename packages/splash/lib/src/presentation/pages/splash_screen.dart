import 'package:flutter/material.dart';

import 'package:color_package/color_package.dart';
import 'package:shared_resources/shared_resources.dart';

import 'package:splash/src/presentation/widgets/powered_by.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();

    // Delay and navigate
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: Container(
          color: AppColors.white,
          child: Column(
            children: [
              // Center content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "packages/splash/assets/open_sky_logo.png",
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(height: 20),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) =>
                            const LinearGradient(
                              colors: [
                                AppColors.hrManagementTxtBlue,
                                AppColors.hrManagementTxtRed,
                              ],
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: const Text(
                          "HR Management",
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom widget
              const PoweredByWidget(),
              const SizedBox(height: 16), // optional bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
