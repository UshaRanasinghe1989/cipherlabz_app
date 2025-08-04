import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

abstract class LeaveRepository {
  Future<Either<Failure, List<LeaveRequestEntity>>> getMyLeaveRequests(
    int userId,
  );
}
