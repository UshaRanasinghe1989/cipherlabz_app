import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class LeaveRepository {
  Future<Either<Failure, List<dynamic>>> getMyLeaveRequests(int userId);
}
