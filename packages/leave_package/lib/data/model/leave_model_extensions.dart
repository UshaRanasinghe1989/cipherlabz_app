import 'package:leave_package/leave_package.dart';

//CASUAL LEAVE MODEL => ENTITY
extension CasualLeaveModelMapper on CasualLeaveRequestModel {
  CasualLeaveRequestEntity toEntity() {
    return CasualLeaveRequestEntity(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      status: status,
    );
  }
}

//CASUAL LEAVE ENTITY => MODEL
extension CasualLeaveEntityMapper on CasualLeaveRequestEntity {
  CasualLeaveRequestModel toModel() {
    return CasualLeaveRequestModel(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      status: status,
    );
  }
}

//ANNUAL LEAVE MODEL => ENTITY
extension AnnualLeaveModelMapper on AnnualLeaveRequestModel {
  AnnualLeaveRequestEntity toEntity() {
    return AnnualLeaveRequestEntity(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      status: status,
    );
  }
}

//ANNUAL LEAVE ENTITY => MODEL
extension AnnualLeaveEntityMapper on AnnualLeaveRequestEntity {
  AnnualLeaveRequestModel toModel() {
    return AnnualLeaveRequestModel(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
      status: status,
    );
  }
}

//LEAVE ATTACHMENT MODEL => ENTITY
extension AttachmentModelMapper on AttachmentModel {
  AttachmentEntity toEntity() {
    return AttachmentEntity(
      name: name,
      mimeType: mimeType,
      base64Data: base64Data,
    );
  }
}

//LEAVE ATTACHMENT ENTITY => MODEL
extension AttachmentEntityMapper on AttachmentEntity {
  AttachmentModel toModel() {
    return AttachmentModel(
      name: name,
      mimeType: mimeType,
      base64Data: base64Data,
    );
  }
}
