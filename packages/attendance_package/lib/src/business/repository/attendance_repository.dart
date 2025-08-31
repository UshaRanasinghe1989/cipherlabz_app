import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

abstract class AttendanceRepository {
  //SAVE ATTENDANCE
  Future<Either<Failure, AttendanceEntity>> saveAttendance(
    AttendanceEntity entity,
  );

  //IS EXISTING
  Future<bool> isCheckedIn(int userId);

  //GET ATTENDANCE OBJECT
  Future<Either<Failure, AttendanceEntity>> getAttendanceObj(
    int userId,
    DateTime checkIn,
  );

  //GET LOCATION
  LocationData getLocation();
  //GET USER ATTENDANCE
  Future<Either<Failure, List<AttendanceEntity>>> getMyAttendance(
    int myUserId,
    int numberOfDays,
  );
  //GET EMPLOYEE ATTENDANCE
  Future<Either<Failure, List<AttendanceEntity>>> getEmpAttendanceCurrentYear(
    int empId,
    DateTime fromDate,
    DateTime toDate,
  );
  //GET SUBORDINATE USER - ATTENDANCE LIST
  Future<Either<Failure, List<EmployeeAttendanceEntity>>>
  getEmployeeAttendanceList(List<int> subordinateIdList);

  //GET EMPLOYEE ATTENDANCE COUNT
  Future<Either<Failure, int>> getEmpAttendanceCount(DateTime today);

  //GET EMPLOYEE LATE COUNT
  Future<Either<Failure, int>> getEmpLateCount(DateTime today);

  //GET EMPLOYEE LEAVE COUNT
  Future<Either<Failure, int>> getEmpLeaveCount(DateTime today);
}
