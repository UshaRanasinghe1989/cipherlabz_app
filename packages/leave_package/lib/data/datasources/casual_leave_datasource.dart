import 'package:leave_package/leave_package.dart';

abstract class CasualLeaveDatasource {
  //GET MY CASUAL LEAVES LIST
  Future<List<CasualLeaveRequestModel>> getMyCasualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
  //GET LEAVE REQUESTS BY STATUS AND DATE RANGE
  Future<List<CasualLeaveRequestModel>> getCasualLeaveRequestsByStatus(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  );
  //SAVE LEAVE REQUEST
  Future<CasualLeaveRequestModel> saveLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  );
  //REJECT LEAVE REQUEST
  Future<CasualLeaveRequestModel> rejectLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  );
  //APPROVE LEAVE REQUEST
  Future<CasualLeaveRequestModel> approveLeaveRequest(
    CasualLeaveRequestModel casualLeaveRequestModel,
  );
}
