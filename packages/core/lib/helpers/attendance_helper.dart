import 'package:attendance_package/attendance_package.dart';

class AttendanceHelper {
  //IS CHECKED IN
  static bool isCheckedIn(int userId) {
    bool res = AttendanceData.attendanceMap
        .cast<int, AttendanceEntity>()
        .values
        .any(
          (attendance) =>
              userId == attendance.userId &&
              isSameDay(attendance.checkIn, DateTime.now()),
        );
    return res;
  }

  //IS SAME DAY
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
