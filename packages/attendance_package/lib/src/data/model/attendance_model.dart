import 'package:attendance_package/src/business/entity/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  AttendanceModel({
    required super.id,
    required super.userId,
    required super.checkIn,
    required super.checkOut,
    required super.latitude,
    required super.longitude,
  });
}
