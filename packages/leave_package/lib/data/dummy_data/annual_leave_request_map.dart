import 'package:leave_package/leave_package.dart';

class AnnualLeaveRequestMap {
  static Map<int, AnnualLeaveRequestModel> annualLeaveMap = {
    0: AnnualLeaveRequestModel(
      id: 0,
      userId: 0,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 12, 25),
      toDate: DateTime(2025, 12, 30),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.pending,
    ),
    1: AnnualLeaveRequestModel(
      id: 0,
      userId: 1,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 12, 1),
      toDate: DateTime(2025, 12, 7),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
    2: AnnualLeaveRequestModel(
      id: 0,
      userId: 2,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 12, 15),
      toDate: DateTime(2025, 12, 20),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.rejected,
    ),
  };
}
