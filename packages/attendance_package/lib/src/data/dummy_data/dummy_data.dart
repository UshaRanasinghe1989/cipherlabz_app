import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/enum/attendance_status.dart';

class AttendanceData {
  static Map<int, AttendanceModel> attendanceMap = {
    0: AttendanceModel(
      id: 0,
      userId: 1,
      checkIn: DateTime(2025, 8, 10, 8, 45),
      checkOut: DateTime(2025, 8, 10, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.ontime,
    ),
    1: AttendanceModel(
      id: 1,
      userId: 2,
      checkIn: DateTime(2025, 8, 10, 9, 45),
      checkOut: DateTime(2025, 8, 10, 17, 15),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.late,
    ),
    2: AttendanceModel(
      id: 2,
      userId: 0,
      checkIn: DateTime(2025, 8, 10, 0, 0),
      checkOut: DateTime(2025, 8, 10, 0, 0),
      latitude: 6.9271,
      longitude: 79.8612,
      status: AttendanceStatus.leave,
    ),
  };
}
