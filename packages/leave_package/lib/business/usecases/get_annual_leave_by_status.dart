import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class GetAnnualLeaveRequestsByStatusUseCase {
  final LeaveRepository leaveRepository;

  GetAnnualLeaveRequestsByStatusUseCase({required this.leaveRepository});

  Future<Either<Failure, List<LeaveRequestEntity>>> call(
    int userId,
    DateTime fromDate,
    DateTime toDate,
  ) async {
    return await leaveRepository.getAnnualLeaveRequestsByStatus(
      userId,
      fromDate,
      toDate,
    );
  }
}
