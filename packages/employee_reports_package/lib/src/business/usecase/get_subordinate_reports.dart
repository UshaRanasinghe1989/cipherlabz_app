import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:leave_package/leave_package.dart';

class GetSubordinateReportsUseCase {
  final SubordinateReportsRepository repository;

  GetSubordinateReportsUseCase({required this.repository});

  Future<Either<Failure, List<SubordinateReport>>> call(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    return await repository.getSubordinateReports(
      subordinateIdList,
      fromDate,
      toDate,
      leaveRequestStatus,
    );
  }
}
