import 'package:attendance_package/attendance_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceDataSourceProvider = Provider<AttendanceLocalDataSource>((ref) {
  return AttendanceLocalDataSource();
});
