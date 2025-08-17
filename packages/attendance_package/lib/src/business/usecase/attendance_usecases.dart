import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/business/usecase/get_emp_attendance_current_year.dart';

class AttendanceUseCases {
  final GetAttendanceUseCase getAttendanceObj;
  final SaveAttendanceUseCase saveAttendance;
  final IsCheckedInUseCase isCheckedIn;
  final GetMyAttendanceUseCase getMyAttendance;
  final GetEmployeeAttendanceUseCase getEmployeeAttendance;
  final GetEmpAttendanceCurrentYearUseCase getEmpAttendanceCurrentYearUseCase;

  AttendanceUseCases({
    required this.getAttendanceObj,
    required this.saveAttendance,
    required this.isCheckedIn,
    required this.getMyAttendance,
    required this.getEmployeeAttendance,
    required this.getEmpAttendanceCurrentYearUseCase,
  });
}
