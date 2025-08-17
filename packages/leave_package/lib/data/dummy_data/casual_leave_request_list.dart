import 'package:leave_package/leave_package.dart';

class CasualLeaveRequestList {
  static List<CasualLeaveRequestModel> casualLeaveList = [
    CasualLeaveRequestModel(
      id: 0,
      userId: 0,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 18),
      toDate: DateTime(2025, 8, 18),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
    CasualLeaveRequestModel(
      id: 0,
      userId: 1,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 20),
      toDate: DateTime(2025, 8, 20),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
    CasualLeaveRequestModel(
      id: 0,
      userId: 2,
      leaveType: LeaveTypes.casual,
      fromDate: DateTime(2025, 8, 23),
      toDate: DateTime(2025, 8, 23),
      reason: "Personal",
      attachment: null,
      status: LeaveRequestStatus.approved,
    ),
  ];
}
