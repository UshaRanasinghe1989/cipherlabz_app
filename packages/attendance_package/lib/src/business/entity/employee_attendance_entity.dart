import 'package:attendance_package/attendance_package.dart';
import 'package:user_package/user_package.dart';

class EmployeeAttendanceEntity {
  final UserEntity userEntity;
  final AttendanceEntity attendanceEntity;

  EmployeeAttendanceEntity({
    required this.userEntity,
    required this.attendanceEntity,
  });

  //ENTITY => MODEL
  EmployeeAttendanceModel toModel() {
    return EmployeeAttendanceModel(
      userEntity.toModel(),
      attendanceEntity.toModel(),
    );
  }
}
