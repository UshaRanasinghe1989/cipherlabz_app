//CORE

import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:collection/collection.dart';
import 'package:core/errors/exceptions.dart';
//DATA
import 'package:attendance_package/src/data/dummy_data/dummy_data.dart';
import 'package:attendance_package/src/data/model/attendance_model.dart';
import 'package:core/errors/failure.dart';
import 'package:core/helpers/attendance_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:login_package/login_package.dart';

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

      return getAttendanceObj(user!.id, DateTime.now());
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
}
