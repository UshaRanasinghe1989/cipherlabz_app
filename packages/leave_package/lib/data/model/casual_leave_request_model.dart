import 'package:leave_package/leave_package.dart';

class CasualLeaveRequestModel {
  final int id;
  final int userId;
  final LeaveTypes leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final AttachmentModel attachment;
  final LeaveRequestStatus status;

  CasualLeaveRequestModel({
    required this.id,
    required this.userId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.attachment,
    required this.status,
  });

  CasualLeaveRequestEntity toEntity() {
    return CasualLeaveRequestEntity(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      attachment: attachment.toEntity(),
      status: status,
    );
  }
}
