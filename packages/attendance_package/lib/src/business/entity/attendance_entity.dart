import 'package:flutter/material.dart';
//DATA
import 'package:attendance_package/src/data/model/attendance_model.dart';
//ENUM
import 'package:attendance_package/src/enum/attendance_status.dart';

class AttendanceEntity {
  final int id;
  final int userId;
  final DateTime checkIn;
  final DateTime checkOut;
  final double latitude;
  final double longitude;
  AttendanceStatus status;

  AttendanceEntity({
    required this.id,
    required this.userId,
    required this.checkIn,
    required this.checkOut,
    required this.latitude,
    required this.longitude,
    this.status = AttendanceStatus.pending,
  });

  //ENTITY => MODEL
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

  void setStatus(DateTime checkIn) {
    TimeOfDay checkInTime = TimeOfDay.fromDateTime(checkIn);
    const TimeOfDay startTime = TimeOfDay(hour: 8, minute: 30);

    if (_isAfter(checkInTime, startTime)) {
      status = AttendanceStatus.ontime;
    }
  }

  bool _isAfter(TimeOfDay t1, TimeOfDay t2) {
    return t1.hour < t2.hour || (t1.hour == t2.hour && t1.minute < t2.minute);
  }
}
