import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

abstract class LeaveRepository {
  //GET LEAVE REQUESTS
  Future<Either<Failure, List<LeaveRequestEntity>>> getMyLeaveRequests(
    int userId,
  );
  //GET LEAVE REQUESTS BY STATUS
  Future<Either<Failure, List<LeaveRequestWithUserEntity>>>
  getLeaveRequestsByStatus(
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  );
  //SAVE LEAVE REQUEST
  Future<Either<Failure, LeaveRequestEntity>> saveLeaveRequest(
    int userId,
    LeaveTypes leaveType,
    DateTime fromDate,
    DateTime toDate,
    String? reason,
    AttachmentEntity? attachment,
  );
}
