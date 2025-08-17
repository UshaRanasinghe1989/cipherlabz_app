import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetEmpAttendanceCurrentYearUseCase {
  final AttendanceRepository repository;

  GetEmpAttendanceCurrentYearUseCase({required this.repository});

  Future<Either<Failure, List<AttendanceEntity>>> call(
    int empId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    return await repository.getEmpAttendanceCurrentYear(
      empId,
      fromDate,
      toDate,
    );
  }
}
