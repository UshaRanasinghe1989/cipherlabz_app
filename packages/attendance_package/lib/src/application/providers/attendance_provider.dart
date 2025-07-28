import 'package:flutter_riverpod/flutter_riverpod.dart';
//ATTENDANCE PACKAGE
import 'package:attendance_package/attendance_package.dart';

final attendanceProvider =
    NotifierProvider<AttendanceNotifier, AttendanceState>(
      AttendanceNotifier.new,
    );
