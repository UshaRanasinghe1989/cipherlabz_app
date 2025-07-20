import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//RESOURCES
import 'package:shared_resources/shared_resources.dart';
//CUSTOM PACKAGES
import 'package:announcement_package/announcement_package.dart';
import 'package:schedule_package/schedule_package.dart';
//PAGES
import 'package:splash/splash.dart';
import 'package:login_package/login_package.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AttendanceProvider()),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(user: null, failure: null),
        ),
        ChangeNotifierProvider(create: (context) => ScheduleProvider()),
        ChangeNotifierProvider(create: (context) => AnnouncementProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
