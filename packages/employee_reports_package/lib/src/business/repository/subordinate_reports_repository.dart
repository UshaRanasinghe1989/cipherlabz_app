import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:leave_package/leave_package.dart';

abstract class SubordinateReportsRepository {
  //GET SUBORDIBATE REPORTS
  Future<Either<Failure, List<SubordinateReport>>> getSubordinateReports(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  );
}
