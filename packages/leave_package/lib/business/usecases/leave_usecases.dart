import 'package:leave_package/leave_package.dart';

class LeaveUsecases {
  final GetMyLeaveRequestsUseCase getMyLeaveRequestsUseCase;
  final GetLeaveRequestsByStatusUseCase getLeaveRequestsByStatusUseCase;
  final SaveLeaveRequestUseCase saveLeaveRequestUseCase;
  final RejectLeaveRequestUseCase rejectLeaveRequestUseCase;
  final ApproveLeaveRequestUseCase approveLeaveRequestUseCase;

  LeaveUsecases({
    required this.getMyLeaveRequestsUseCase,
    required this.getLeaveRequestsByStatusUseCase,
    required this.saveLeaveRequestUseCase,
    required this.rejectLeaveRequestUseCase,
    required this.approveLeaveRequestUseCase,
  });
}
