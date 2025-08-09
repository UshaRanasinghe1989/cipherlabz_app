import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class GetCasualLeaveRequestsByStatusUseCase {
  final LeaveRepository leaveRepository;

  GetCasualLeaveRequestsByStatusUseCase({required this.leaveRepository});

  Future<Either<Failure, List<LeaveRequestEntity>>> call(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    return await leaveRepository.getCasualLeaveRequestsByStatus(
      userId,
      fromDate,
      toDate,
    );
  }
}
