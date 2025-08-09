import 'package:leave_package/leave_package.dart';

abstract class AnnualLeaveDatasource {
  //GET MY ANNUAL LEAVES LIST
  Future<List<AnnualLeaveRequestModel>> getMyAnnualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
  //GET LEAVE REQUESTS BY STATUS AND DATE RANGE
  Future<List<AnnualLeaveRequestModel>> getAnnualLeaveRequestsByStatus(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  );
  //SAVE ANNUAL LEAVE REQUEST
  Future<AnnualLeaveRequestModel> saveLeaveRequest(
    AnnualLeaveRequestModel annualLeaveRequestModel,
  );
}
