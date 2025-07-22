import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
//BUSINESS
import 'package:attendance_package/src/business/entity/attendance_entity.dart';

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
}
