import 'package:dartz/dartz.dart';
//SHARED RESOURCES
import 'package:core/errors/failure.dart';
//BUSINESS
import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:attendance_package/src/business/repository/attendance_repository.dart';
//DATA
import 'package:attendance_package/src/data/datasource/attendance_local_datasource.dart';
//LOCATION
import 'package:location_platform_interface/location_platform_interface.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  AttendanceLocalDataSource dataSource = AttendanceLocalDataSource();

  AttendanceRepositoryImpl.repo();
  AttendanceRepositoryImpl({required this.dataSource});

  @override
  LocationData getLocation() {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  //SAVE ATTENDANCE
  @override
  Future<Either<Failure, AttendanceEntity>> saveAttendance(
    AttendanceEntity entity,
  ) async {
    try {
      return await dataSource.insertAttendance(entity.toModel());
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: "Database failure !"));
    }
  }

  //IS EXISTING
  @override
  Future<bool> isCheckedIn(int userId) async {
    try {
      return await dataSource.isCheckedIn(userId);
    } catch (e) {
      return false;
    }
  }

  //GET ATTENDANCE ENTITY OBJECT
  @override
  Future<Either<Failure, AttendanceEntity>> getAttendanceObj(
    int userId,
    DateTime checkIn,
  ) async {
    try {
      return await dataSource.getAttendanceObj(userId, checkIn);
    } catch (e) {
      return Left(GeneralFailure(errorMessage: "An Error Occurred!"));
    }
  }

  //GET MY ATTENDANCE
  @override
  Future<Either<Failure, List<AttendanceEntity>>> getMyAttendance(
    int myUserId,
    int numberOfDays,
  ) async {
    return await dataSource.getMyAttendance(myUserId, numberOfDays);
  }

  //GET EMPLOYEE ATTENDANCE LIST
  @override
  Future<Either<Failure, List<AttendanceEntity>>> getEmployeeAttendanceList(
    List<int> subordinateIdList,
  ) async {
    return await dataSource.getEmployeeAttendanceList(subordinateIdList);
  }
}
