import 'package:leave_package/leave_package.dart';

abstract class CasualLeaveDatasource {
  //GET MY CASUAL LEAVES LIST
  Future<List<CasualLeaveRequestModel>> getMyCasualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
  //GET LEAVE REQUESTS BY STATUS AND DATE RANGE
  Future<List<CasualLeaveRequestModel>> getCasualLeaveRequestsByStatus(
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  );

  Future<CasualLeaveRequestModel> saveLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  );
}
