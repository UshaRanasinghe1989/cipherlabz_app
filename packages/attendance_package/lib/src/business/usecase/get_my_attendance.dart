import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetMyAttendanceUseCase {
  final AttendanceRepository repository;

  GetMyAttendanceUseCase({required this.repository});

  Future<Either<Failure, List<AttendanceEntity>>> call(
    int myUserId,
    int numberOfDays,
  ) async {
    return await repository.getMyAttendance(myUserId, numberOfDays);
  }
}
