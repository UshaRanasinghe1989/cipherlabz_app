import 'package:leave_package/leave_package.dart';
import 'package:user_package/user_package.dart';

//CASUAL LEAVE MODEL => ENTITY
extension CasualLeaveModelMapper on CasualLeaveRequestModel {
  CasualLeaveRequestEntity toEntity() {
    return CasualLeaveRequestEntity(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason ?? "",
      attachment: attachment?.toEntity(),
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
      reason: reason ?? "",
      attachment: attachment?.toModel(),
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
      reason: reason ?? "",
      attachment: attachment?.toEntity(),
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
      reason: reason ?? "",
      attachment: attachment?.toModel(),
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

//LEAVE REQUEST WITH USER ENTITY => MODEL
extension LeaveRequestWithUserEntityMapper on LeaveRequestWithUserEntity {
  LeaveRequestWithUserModel toModel() {
    return LeaveRequestWithUserModel(
      userModel: userEntity.toModel(),
      leaveRequestEntity: leaveRequestEntity,
    );
  }
}

//LEAVE REQUEST WITH USER MODEL => ENTITY
extension LeaveRequestWithUserModelMapper on LeaveRequestWithUserModel {
  LeaveRequestWithUserEntity toEntity() {
    return LeaveRequestWithUserEntity(
      userEntity: userModel.toEntity(),
      leaveRequestEntity: leaveRequestEntity,
    );
  }
}

//LEAVE REQUEST ENTITY => CASUAL LEAVE MODEL
extension CasualLeaveRequestEntityMapper on LeaveRequestEntity {
  CasualLeaveRequestModel toCasualModel() {
    return CasualLeaveRequestModel(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      status: status,
    );
  }
}

//LEAVE REQUEST ENTITY => ANNUAL LEAVE MODEL
extension AnnualLeaveRequestEntityMapper on LeaveRequestEntity {
  AnnualLeaveRequestModel toAnnualModel() {
    return AnnualLeaveRequestModel(
      id: id,
      userId: userId,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      status: status,
    );
  }
}
