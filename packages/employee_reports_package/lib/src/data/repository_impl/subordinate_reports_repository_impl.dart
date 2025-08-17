import 'package:attendance_package/attendance_package.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';
import 'package:user_package/user_package.dart';

class SubordinateReportsRepositoryImpl implements SubordinateReportsRepository {
  final logger = Logger();
  final UserRepository userRepo;
  final AttendanceRepository attendanceRepo;
  final LeaveRepository leaveRepo;

  SubordinateReportsRepositoryImpl({
    required this.userRepo,
    required this.attendanceRepo,
    required this.leaveRepo,
  });

  @override
  Future<Either<Failure, List<SubordinateReport>>> getSubordinateReports(
    List<int> subordinateIds,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    logger.i("Subordinate reports repo-impl : $toDate");
    // Wait for all results
    final results = await Future.wait(
      subordinateIds.map((subId) async {
        // GET SUBORDINATE OBJECT
        final subordinateObjResult = await userRepo.getEmployee(subId);
        final subordinateObj = subordinateObjResult.fold<UserEntity?>((
          failure,
        ) {
          logger.e("Failed to fetch subordinate $subId: $failure");
          return null;
        }, (userEntity) => userEntity);

        // GET ATTENDANCE LIST
        final attendanceResult = await attendanceRepo
            .getEmpAttendanceCurrentYear(subId, fromDate, toDate);
        final attendanceList = attendanceResult.fold<List<AttendanceEntity>?>((
          failure,
        ) {
          logger.e("Failed to fetch subordinate $subId: $failure");
          return null;
        }, (list) => list);

        // GET LEAVE LIST
        final leaveResult = await leaveRepo.getEmpLeaveRequestsByStatus(
          [subId],
          fromDate,
          toDate,
          leaveRequestStatus,
        );
        final leaveList = leaveResult.fold<List<LeaveRequestEntity>?>(
          (failure) {
            logger.e("Failed to fetch subordinate $subId");
            return null;
          },
          (list) {
            logger.i("List length : ${list.length}");
            return list;
          },
        );

        if (subordinateObj != null) {
          return SubordinateReport(
            subordinateObj: subordinateObj,
            subordinateAttendanceList: attendanceList ?? [],
            subordinateLeaveRequestsList: leaveList ?? [],
          );
        }
        return null; // skipped if no subordinate
      }),
    );

    // Filter out nulls after the await
    final nonNullReports = results.whereType<SubordinateReport>().toList();

    return Right(nonNullReports);
  }
}
