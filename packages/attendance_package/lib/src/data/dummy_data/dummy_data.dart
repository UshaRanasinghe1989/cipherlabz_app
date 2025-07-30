import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:attendance_package/src/enum/attendance_status.dart';

class AttendanceData {
  static Map<int, AttendanceEntity> attendanceMap = {
    0: AttendanceEntity(
      id: 0,
      userId: 1,
      checkIn: DateTime(2025, 7, 30, 8, 45),
      checkOut: DateTime(2025, 7, 30, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.ontime,
    ),
    1: AttendanceEntity(
      id: 1,
      userId: 2,
      checkIn: DateTime(2025, 7, 30, 9, 45),
      checkOut: DateTime(2025, 7, 30, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.late,
    ),
    2: AttendanceEntity(
      id: 2,
      userId: 0,
      checkIn: DateTime(2025, 7, 30, 0, 0),
      checkOut: DateTime(2025, 7, 30, 0, 0),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.leave,
    ),
  };
}
