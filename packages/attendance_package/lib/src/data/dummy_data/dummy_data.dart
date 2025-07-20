import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:attendance_package/src/enum/attendance_status.dart';

class AttendanceData {
  static Map<int, AttendanceEntity> attendanceMap = {
    0: AttendanceEntity(
      id: 0,
      userId: 1,
      checkIn: DateTime(2025, 7, 1, 8, 45),
      checkOut: DateTime(2025, 7, 1, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.ontime,
    ),
    1: AttendanceEntity(
      id: 1,
      userId: 0,
      checkIn: DateTime(2025, 7, 2, 9, 45),
      checkOut: DateTime(2025, 7, 2, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.late,
    ),
    2: AttendanceEntity(
      id: 2,
      userId: 1,
      checkIn: DateTime(2025, 7, 3, 00, 00),
      checkOut: DateTime(2025, 7, 3, 00, 00),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.leave,
    ),
  };
}
