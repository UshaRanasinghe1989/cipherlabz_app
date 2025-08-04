import 'package:leave_package/leave_package.dart';

abstract class LeaveDataSource {
  //GET MY CASUAL LEAVES LIST
  Future<List<CasualLeaveRequestModel>> getMyCasualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
  //GET MY ANNUAL LEAVES LIST
  Future<List<AnnualLeaveRequestModel>> getMyAnnualLeaveRequests(
    int userId,
    DateTime fromDate,
  );
}
