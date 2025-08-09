import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

abstract class LeaveRepository {
  //GET LEAVE REQUESTS
  Future<Either<Failure, List<LeaveRequestEntity>>> getMyLeaveRequests(
    int userId,
  );
  //GET CASUAL LEAVE REQUESTS
  Future<Either<Failure, List<LeaveRequestEntity>>>
  getCasualLeaveRequestsByStatus(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  );
  //GET ANNUAL LEAVE REQUESTS
  Future<Either<Failure, List<LeaveRequestEntity>>>
  getAnnualLeaveRequestsByStatus(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  );

  Future<Either<Failure, LeaveRequestEntity>> saveLeaveRequest(
    int userId,
    LeaveTypes leaveType,
    DateTime fromDate,
    DateTime toDate,
    String? reason,
    AttachmentEntity? attachment,
  );
}
