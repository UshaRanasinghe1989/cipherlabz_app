import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetEmployeeAttendanceUseCase {
  final AttendanceRepository repository;

  GetEmployeeAttendanceUseCase({required this.repository});

  Future<Either<Failure, List<AttendanceEntity>>> call(
    List<int> subordinateIdList,
  ) async {
    print("GET EMPLOYEE ATTENDANCE LIST-usecase");
    return await repository.getEmployeeAttendanceList(subordinateIdList);
  }
}
