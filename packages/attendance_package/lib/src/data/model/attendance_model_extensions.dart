import 'package:attendance_package/attendance_package.dart';

extension AttendanceModelMapper on AttendanceModel {
  AttendanceEntity toEntity() {
    return AttendanceEntity(
      id: id,
      userId: userId,
      checkIn: checkIn,
      checkOut: checkOut,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

//CASUAL LEAVE ENTITY => MODEL
extension AttendanceEntityMapper on AttendanceEntity {
  AttendanceModel toModel() {
    return AttendanceModel(
      id: id,
      userId: userId,
      checkIn: checkIn,
      checkOut: checkOut,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
