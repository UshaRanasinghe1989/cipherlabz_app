import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:attendance_package/src/business/repository/attendance_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetAttendanceUseCase {
  final AttendanceRepository repository;

  GetAttendanceUseCase({required this.repository});

  Future<Either<Failure, AttendanceEntity>> call(
    int userId,
    DateTime checkIn,
  ) async {
    if (await AttendanceHelper.isCheckedIn(userId)) {
      return await repository.getAttendanceObj(userId, checkIn);
    } else {
      return Left(GeneralFailure(errorMessage: "An Error Occurred"));
    }
  }
}
