import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:leave_package/leave_package.dart';

class GetLeaveRequestsByStatusUseCase {
  final LeaveRepository leaveRepository;

  GetLeaveRequestsByStatusUseCase({required this.leaveRepository});

  Future<Either<Failure, List<LeaveRequestWithUserEntity>>> call(
    List<int> subordinateIdList,
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    return await leaveRepository.getLeaveRequestsByStatus(
      subordinateIdList,
      fromDate,
      toDate,
      leaveRequestStatus,
    );
  }
}
