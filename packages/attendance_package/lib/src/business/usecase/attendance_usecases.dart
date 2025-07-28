import 'package:attendance_package/attendance_package.dart';

class AttendanceUseCases {
  final GetAttendanceUseCase getAttendanceObj;
  final SaveAttendanceUseCase saveAttendance;
  final IsCheckedInUseCase isCheckedIn;
  final GetMyAttendanceUseCase getMyAttendance;
  final GetEmployeeAttendanceUseCase getEmployeeAttendance;

  AttendanceUseCases({
    required this.getAttendanceObj,
    required this.saveAttendance,
    required this.isCheckedIn,
    required this.getMyAttendance,
    required this.getEmployeeAttendance,
  });
}
