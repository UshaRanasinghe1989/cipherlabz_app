import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetEmployeeAttendanceUseCase {
  final AttendanceRepository repository;

  GetEmployeeAttendanceUseCase({required this.repository});

  Future<Either<Failure, List<EmployeeAttendanceEntity>>> call(
    List<int> subordinateIdList,
  ) async {
    return await repository.getEmployeeAttendanceList(subordinateIdList);
  }
}
