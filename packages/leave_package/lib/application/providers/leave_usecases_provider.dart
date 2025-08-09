import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/business/usecases/save_leave_request.dart';
import 'package:leave_package/leave_package.dart';

final leaveUseCasesProvider = Provider<LeaveUsecases>((ref) {
  final repository = ref.read(leaveRepositoryProvider);

  return LeaveUsecases(
    getMyLeaveRequestsUseCase: GetMyLeaveRequestsUseCase(
      leaveRepository: repository,
    ),
    getCasualLeaveRequestsByStatusUseCase:
        GetCasualLeaveRequestsByStatusUseCase(leaveRepository: repository),
    getAnnualLeaveRequestsByStatusUseCase:
        GetAnnualLeaveRequestsByStatusUseCase(leaveRepository: repository),
    saveLeaveRequestUseCase: SaveLeaveRequestUseCase(
      leaveRepository: repository,
    ),
  );
});
