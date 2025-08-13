import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class RejectLeaveRequestUseCase {
  final LeaveRepository leaveRepository;

  RejectLeaveRequestUseCase({required this.leaveRepository});

  Future<Either<Failure, LeaveRequestEntity>> call(
    LeaveRequestEntity leaveRequestEntity,
  ) async {
    return await leaveRepository.rejectLeaveRequest(leaveRequestEntity);
  }
}
