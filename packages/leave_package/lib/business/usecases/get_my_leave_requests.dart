import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class GetMyLeaveRequestsUseCase {
  final LeaveRepository leaveRepository;

  GetMyLeaveRequestsUseCase({required this.leaveRepository});

  Future<Either<Failure, List<LeaveRequestEntity>>> call(int userId) async {
    return await leaveRepository.getMyLeaveRequests(userId);
  }
}
