import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class SaveLeaveRequestUseCase {
  final LeaveRepository leaveRepository;

  SaveLeaveRequestUseCase({required this.leaveRepository});

  Future<Either<Failure, LeaveRequestEntity>> call(
    int userId,
    LeaveTypes leaveType,
    DateTime fromDate,
    DateTime toDate,
    String? reason,
    AttachmentEntity? attachment,
  ) async {
    return await leaveRepository.saveLeaveRequest(
      userId,
      leaveType,
      fromDate,
      toDate,
      reason,
      attachment,
    );
  }
}
