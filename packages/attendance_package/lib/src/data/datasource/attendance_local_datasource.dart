import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
//RESOURCES
import 'package:core/errors/failure.dart';
import 'package:core/helpers/attendance_helper.dart';
//PACKAGE
import 'package:attendance_package/attendance_package.dart';
import 'package:user_package/user_package.dart';

class AttendanceLocalDataSource {
  Future<Either<Failure, AttendanceEntity>> insertAttendance(
    AttendanceModel model,
  ) async {
    try {
      final attendanceMap = AttendanceData.attendanceMap;
      final newKey =
          (attendanceMap.isNotEmpty
              ? (attendanceMap.keys.toList()..sort()).last
              : 0) +
          1;
      attendanceMap[newKey] = model.toEntity();

      return getAttendanceObj(model.id, DateTime.now());
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: "$e"));
    }
  }

  Future<bool> isCheckedIn(int userId) async {
    return await AttendanceHelper.isCheckedIn(userId);
  }

  //GET ATTENDANCE ENTITY OBJECT
  Future<Either<Failure, AttendanceEntity>> getAttendanceObj(
    int userId,
    DateTime checkIn,
  ) async {
    final entity = AttendanceData.attendanceMap.values.firstWhereOrNull(
      (e) => AttendanceHelper.isCheckedIn(userId),
    );

    if (entity != null) {
      return Right(entity);
    } else {
      return Left(
        GeneralFailure(errorMessage: "No attendance found for userId $userId"),
      );
    }
  }

  //GET MY ATTENDANCE LIST
  Future<Either<Failure, List<AttendanceEntity>>> getMyAttendance(
    int myUserId,
    int numberOfDays,
  ) async {
    Map<int, AttendanceEntity> attendanceMap = AttendanceData.attendanceMap;
    //CREATE A LIST WITH LAST 30 DAY INCLUDING TODAY
    List<DateTime> last30DaysList = List.generate(numberOfDays, (i) {
      return DateTime.now().subtract(Duration(days: i));
    });
    //CREATE ATTENDANCE ENTITY LIST
    List<AttendanceEntity> myAttendanceList = [];
    AttendanceEntity? obj = attendanceMap.values.firstWhereOrNull(
      (e) =>
          e.userId == myUserId &&
          last30DaysList.any((d) => AttendanceHelper.isSameDay(d, e.checkIn)),
    );
    if (obj != null) {
      myAttendanceList.add(obj);
    }
    return myAttendanceList.isNotEmpty
        ? Right(myAttendanceList)
        : Left(NullFailure(errorMessage: 'No date available !'));
  }

  //GET EMPLOYEE ATTENDANCE LIST
  Future<Either<Failure, List<EmployeeAttendanceEntity>>>
  getEmployeeAttendanceList(List<int> subordinateIdList) async {
    List<EmployeeAttendanceEntity> employeeAttendanceList = [];
    for (int id in subordinateIdList) {
      //GET ATTENDANCE ENTITY
      AttendanceEntity? attendanceEntity;
      try {
        final list = AttendanceData.attendanceMap.values
            .where((e) => e.userId == id)
            .toList();
        if (list.isEmpty) {
          continue;
        }
        attendanceEntity = list.first;
      } catch (e) {
        continue;
      }
      //GET USER ENTITY
      UserEntity userEntity;
      try {
        userEntity = await UserSet.usersSet.firstWhere((e) => e.id == id);
      } catch (e) {
        continue;
      }
      //ADD DATA TO EMPLOYEE ATTENDANCE LIST
      employeeAttendanceList.add(
        EmployeeAttendanceEntity(
          userEntity: userEntity,
          attendanceEntity: attendanceEntity,
        ),
      );
    }
    if (employeeAttendanceList.isNotEmpty) {
      print("employeeAttendanceList length: ${employeeAttendanceList.length}");
      return Right(employeeAttendanceList);
    } else {
      return Left(GeneralFailure(errorMessage: "No Date Available !"));
    }
  }
}
