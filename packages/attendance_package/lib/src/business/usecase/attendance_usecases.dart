import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/business/usecase/is_checked_in.dart';

class AttendanceUseCases {
  final GetAttendance getAttendanceObj;
  final SaveAttendanceUseCase saveAttendance;
  final isCheckedInUseCase isCheckedIn;

  AttendanceUseCases({
    required this.getAttendanceObj,
    required this.saveAttendance,
    required this.isCheckedIn,
  });
}
