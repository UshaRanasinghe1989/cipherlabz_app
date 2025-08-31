import 'package:attendance_package/attendance_package.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';
import 'package:user_package/user_package.dart';
import 'package:user_profile_package/user_profile_package.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final logger = Logger();
  final UserRepository userRepo;
  final AttendanceRepository attendanceRepo;
  final LeaveRepository leaveRepo;

  UserProfileRepositoryImpl({
    required this.userRepo,
    required this.attendanceRepo,
    required this.leaveRepo,
  });

  @override
  Future<UserProfileReport> fetchUserProfileReport(DateTime today) async {
    //GET TOTAL NUMBER OF EMPLOYEES
    final employeeCount = UserSet.usersSet.length;
    logger.i("Total number of employees : $employeeCount");
    // GET TOTAL ATTENDANCE FOR THE DAY
    final totalAttendanceResult = await attendanceRepo.getEmpAttendanceCount(
      today,
    );
    final totalAttendance = totalAttendanceResult.fold<int>(
      (failure) {
        logger.e("Total attendance 0");
        return 0;
      },
      (count) {
        logger.i("Total attendance : $count");
        return count;
      },
    );

    //GET TOTAL LATE
    final totalLateResult = await attendanceRepo.getEmpLateCount(today);
    final totalLate = totalLateResult.fold<int>(
      (failure) {
        logger.e("Total late 0");
        return 0;
      },
      (count) {
        logger.i("Total late : $count");
        return count;
      },
    );

    //GET TOTAL LATE
    final totalLeaveResult = await attendanceRepo.getEmpLeaveCount(today);
    final totalLeave = totalLeaveResult.fold<int>(
      (failure) {
        logger.e("Total leave 0");
        return 0;
      },
      (count) {
        logger.i("List leave : $count");
        return count;
      },
    );

    return UserProfileReport(
      totalEmployees: employeeCount,
      totalPresents: totalAttendance,
      totalLate: totalLate,
      totalLeave: totalLeave,
    );
  }
}
