import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class ApproveLeaveRequestUseCase {
  final LeaveRepository leaveRepository;

  ApproveLeaveRequestUseCase({required this.leaveRepository});

  Future<Either<Failure, LeaveRequestEntity>> call(
    LeaveRequestEntity leaveRequestEntity,
  ) async {
    return await leaveRepository.approveLeaveRequest(leaveRequestEntity);
  }
}
