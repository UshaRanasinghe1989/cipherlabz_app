import 'package:leave_package/leave_package.dart';

abstract class AnnualLeaveDatasource {
  //GET MY ANNUAL LEAVES LIST
  Future<List<AnnualLeaveRequestModel>> getMyAnnualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
  //GET LEAVE REQUESTS BY STATUS AND DATE RANGE
  Future<List<AnnualLeaveRequestModel>> getAnnualLeaveRequestsByStatus(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  );
  //SAVE ANNUAL LEAVE REQUEST
  Future<AnnualLeaveRequestModel> saveLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  );
  //REJECT LEAVE REQUEST
  Future<AnnualLeaveRequestModel> rejectLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  );
  //APPROVE LEAVE REQUEST
  Future<AnnualLeaveRequestModel> approveLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  );
}
