import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';

abstract class LeaveDataSource {
  Future<Either<Failure, List<dynamic>>> getMyLeaveRequests(int userId);
}
