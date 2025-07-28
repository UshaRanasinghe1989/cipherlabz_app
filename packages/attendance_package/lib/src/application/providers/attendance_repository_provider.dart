import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:attendance_package/attendance_package.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final dataSource = ref.read(attendanceDataSourceProvider);
  return AttendanceRepositoryImpl(dataSource: dataSource);
});
