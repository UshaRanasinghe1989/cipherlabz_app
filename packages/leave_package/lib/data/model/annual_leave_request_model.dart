import 'package:leave_package/leave_package.dart';

class AnnualLeaveRequestModel {
  final int id;
  final int userId;
  final LeaveTypes leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final String? reason;
  final AttachmentModel? attachment;
  final LeaveRequestStatus status;

  AnnualLeaveRequestModel({
    required this.id,
    required this.userId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    this.reason,
    this.attachment,
    required this.status,
  });

  AnnualLeaveRequestModel copyWith({
    int? id,
    int? userId,
    LeaveTypes? leaveType,
    DateTime? fromDate,
    DateTime? toDate,
    LeaveRequestStatus? status,
    String? reason,
  }) {
    return AnnualLeaveRequestModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      leaveType: leaveType ?? this.leaveType,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      status: status ?? this.status,
      reason: reason ?? this.reason,
    );
  }
}
