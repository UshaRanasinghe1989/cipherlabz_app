import 'package:leave_package/leave_package.dart';

abstract class LeaveRequestEntity {
  int get id;
  int get userId;
  LeaveTypes get leaveType;
  DateTime get fromDate;
  DateTime get toDate;
  String get reason;
  AttachmentEntity? get attachment;
  LeaveRequestStatus get status;
}
