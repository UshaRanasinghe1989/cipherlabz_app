import 'package:leave_package/leave_package.dart';

class CasualLeaveRequestList {
  static List<CasualLeaveRequestModel> casualLeaveList = [
    CasualLeaveRequestModel(
      id: 0,
      userId: 0,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 10),
      toDate: DateTime(2025, 8, 10),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
    CasualLeaveRequestModel(
      id: 0,
      userId: 1,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 11),
      toDate: DateTime(2025, 8, 11),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.rejected,
    ),
    CasualLeaveRequestModel(
      id: 0,
      userId: 2,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 12),
      toDate: DateTime(2025, 8, 12),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
  ];
}
