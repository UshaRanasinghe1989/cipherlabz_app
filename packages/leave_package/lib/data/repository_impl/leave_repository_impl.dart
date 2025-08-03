import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final LeaveDataSource leaveDataSource;

  LeaveRepositoryImpl({required this.leaveDataSource});

  @override
  Future<Either<Failure, List>> getMyLeaveRequests(int userId) async {
    return LeaveDatasourceImpl().getMyLeaveRequests(userId);
  }
}
