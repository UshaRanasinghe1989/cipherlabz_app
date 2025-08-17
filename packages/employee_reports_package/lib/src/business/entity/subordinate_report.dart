import 'package:attendance_package/attendance_package.dart';
import 'package:leave_package/leave_package.dart';
import 'package:user_package/user_package.dart';

class SubordinateReport {
  final UserEntity subordinateObj;
  final List<AttendanceEntity> subordinateAttendanceList;
  final List<LeaveRequestEntity> subordinateLeaveRequestsList;

  SubordinateReport({
    required this.subordinateObj,
    required this.subordinateAttendanceList,
    required this.subordinateLeaveRequestsList,
  });
}
