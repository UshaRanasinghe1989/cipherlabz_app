import 'package:leave_package/business/usecases/save_leave_request.dart';
import 'package:leave_package/leave_package.dart';

class LeaveUsecases {
  final GetMyLeaveRequestsUseCase getMyLeaveRequestsUseCase;
  final GetCasualLeaveRequestsByStatusUseCase
  getCasualLeaveRequestsByStatusUseCase;
  final GetAnnualLeaveRequestsByStatusUseCase
  getAnnualLeaveRequestsByStatusUseCase;
  final SaveLeaveRequestUseCase saveLeaveRequestUseCase;

  LeaveUsecases({
    required this.getMyLeaveRequestsUseCase,
    required this.getCasualLeaveRequestsByStatusUseCase,
    required this.getAnnualLeaveRequestsByStatusUseCase,
    required this.saveLeaveRequestUseCase,
  });
}
