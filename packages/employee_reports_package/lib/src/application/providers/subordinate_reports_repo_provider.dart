import 'package:attendance_package/attendance_package.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';
import 'package:user_package/user_package.dart';

final subordinateRepositoryProvider = Provider<SubordinateReportsRepository>((
  ref,
) {
  final userRepo = ref.read(userRepositoryProvider);
  final attendanceRepo = ref.read(attendanceRepositoryProvider);
  final leaveRepo = ref.read(leaveRepositoryProvider);

  return SubordinateReportsRepositoryImpl(
    userRepo: userRepo,
    attendanceRepo: attendanceRepo,
    leaveRepo: leaveRepo,
  );
});
