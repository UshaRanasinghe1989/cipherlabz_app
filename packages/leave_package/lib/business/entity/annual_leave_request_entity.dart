import 'package:leave_package/leave_package.dart';

class AnnualLeaveRequestEntity {
  final int id;
  final int userId;
  final LeaveTypes leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final AttachmentEntity attachment;
  final LeaveRequestStatus status;

  AnnualLeaveRequestEntity({
    required this.id,
    required this.userId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.attachment,
    required this.status,
  });

  CasualLeaveRequestModel toModel() {
    return CasualLeaveRequestModel(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      attachment: attachment.toModel(),
      status: status,
    );
  }
}
