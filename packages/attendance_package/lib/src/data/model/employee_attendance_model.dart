import 'package:attendance_package/attendance_package.dart';
import 'package:user_package/user_package.dart';

class EmployeeAttendanceModel {
  final UserModel userModel;
  final AttendanceModel attendanceModel;

  EmployeeAttendanceModel(this.userModel, this.attendanceModel);

  EmployeeAttendanceEntity toEntity() {
    return EmployeeAttendanceEntity(
      userEntity: userModel.toEntity(),
      attendanceEntity: attendanceModel.toEntity(),
    );
  }
}
