import 'package:attendance_package/attendance_package.dart';
import 'package:core/helpers/get_location.dart';
import 'package:core/helpers/local_auth.dart';
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
        // 1. Provide AttendanceRepository
        Provider<AttendanceRepository>(
          create: (_) => AttendanceRepositoryImpl.repo(),
        ),
        // 2. Provide AttendanceLocalDataSource
        Provider<AttendanceLocalDataSource>(
          create: (_) => AttendanceLocalDataSource(),
        ),
        // 3. Provide LocalAuth
        Provider<LocalAuth>(create: (_) => LocalAuth()),
        // 4. Provide GetCurrentLoaction
        Provider<GetCurrentLoaction>(create: (_) => GetCurrentLoaction()),
        ProxyProvider<AttendanceRepository, IsCheckedInUseCase>(
          update: (_, repo, __) => IsCheckedInUseCase(repo),
        ),
        // 5. Provide SaveAttendanceUseCase using repository, auth, location
        ProxyProvider3<
          AttendanceRepository,
          LocalAuth,
          GetCurrentLoaction,
          SaveAttendanceUseCase
        >(
          update: (_, repo, auth, location, __) =>
              SaveAttendanceUseCase(repo, auth, location),
        ),

        // 6. Provide GetAttendanceUseCase
        ProxyProvider<AttendanceRepository, GetAttendanceUseCase>(
          update: (_, repo, __) => GetAttendanceUseCase(repository: repo),
        ),
        //PROVIDE GET MY ATTENDANCE USECASE
        ProxyProvider<AttendanceRepository, GetMyAttendanceUseCase>(
          update: (_, repo, __) => GetMyAttendanceUseCase(repository: repo),
        ),

        // 7. Provide AttendanceUseCases grouped
        ProxyProvider4<
          SaveAttendanceUseCase,
          GetAttendanceUseCase,
          IsCheckedInUseCase,
          GetMyAttendanceUseCase,
          AttendanceUseCases
        >(
          update:
              (
                _,
                saveAttendance,
                getAttendance,
                isCheckedIn,
                getMyAttendance,
                __,
              ) => AttendanceUseCases(
                saveAttendance: saveAttendance,
                getAttendanceObj: getAttendance,
                isCheckedIn: isCheckedIn,
                getMyAttendance: getMyAttendance,
              ),
        ),

        // 8. Provide AttendanceProvider using everything
        ChangeNotifierProxyProvider3<
          AttendanceRepository,
          AttendanceLocalDataSource,
          AttendanceUseCases,
          AttendanceProvider
        >(
          create: (_) => AttendanceProvider.empty(), // safe placeholder
          update: (_, repo, dataSource, useCases, __) =>
              AttendanceProvider(repo, dataSource, useCases),
        ),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
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
