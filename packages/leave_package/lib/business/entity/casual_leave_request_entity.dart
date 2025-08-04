import 'package:leave_package/leave_package.dart';

class CasualLeaveRequestEntity implements LeaveRequestEntity {
  final int id;
  final int userId;
  final LeaveTypes leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String reason;
  final AttachmentEntity? attachment;
  final LeaveRequestStatus status;

  CasualLeaveRequestEntity({
    required this.id,
    required this.userId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    this.attachment,
    required this.status,
  });
}
