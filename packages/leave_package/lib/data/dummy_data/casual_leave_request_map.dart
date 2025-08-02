import 'package:leave_package/leave_package.dart';

class CasualLeaveRequestMap {
  static Map<int, CasualLeaveRequestModel> casualLeaveMap = {
    0: CasualLeaveRequestModel(
      id: 0,
      userId: 0,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 3),
      toDate: DateTime(2025, 8, 3),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.pending,
    ),
    1: CasualLeaveRequestModel(
      id: 0,
      userId: 1,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 4),
      toDate: DateTime(2025, 8, 4),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
    2: CasualLeaveRequestModel(
      id: 0,
      userId: 2,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 5),
      toDate: DateTime(2025, 8, 5),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.rejected,
    ),
  };
}
