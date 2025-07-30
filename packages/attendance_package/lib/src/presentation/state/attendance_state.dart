import 'package:attendance_package/attendance_package.dart';
import 'package:core/errors/failure.dart';

class AttendanceState {
  final bool isLoading;
  final Failure? failure;
  final AttendanceEntity? attendance;
  final AttendanceEntity? lastSaved;
  final List<AttendanceEntity>? myAttendanceList;
  final List<EmployeeAttendanceEntity>? employeeAttendanceList;

  AttendanceState({
    this.isLoading = false,
    this.failure,
    this.attendance,
    this.lastSaved,
    this.myAttendanceList,
    this.employeeAttendanceList,
  });

  AttendanceState copyWith({
    bool? isLoading,
    Failure? failure,
    AttendanceEntity? attendance,
    AttendanceEntity? lastSaved,
    List<AttendanceEntity>? myAttendanceList,
    List<EmployeeAttendanceEntity>? employeeAttendanceList,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      attendance: attendance ?? this.attendance,
      lastSaved: lastSaved ?? this.lastSaved,
      myAttendanceList: myAttendanceList ?? myAttendanceList,
      employeeAttendanceList: employeeAttendanceList ?? employeeAttendanceList,
    );
  }
}
