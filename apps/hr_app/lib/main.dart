import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//RESOURCES
import 'package:shared_resources/shared_resources.dart';
//PAGES
import 'package:splash/splash.dart';
import 'package:login_package/login_package.dart';

void main() {
  //runApp(const MyApp());
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppFonts.poppins),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreenWidget(),
        '/login': (context) => LoginWidget(),
      },
      //home: MarkAttendancePageWidget(),
    );
  }
}
