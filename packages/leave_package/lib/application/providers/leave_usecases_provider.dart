import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_repository_provider.dart';
import 'package:leave_package/business/usecases/get_my_leave_requests.dart';
import 'package:leave_package/business/usecases/leave_usecases.dart';

final leaveUseCasesProvider = Provider<LeaveUsecases>((ref) {
  final repository = ref.read(leaveRepositoryProvider);

  return LeaveUsecases(
    getMyLeaveRequestsUseCase: GetMyLeaveRequestsUseCase(
      leaveRepository: repository,
    ),
  );
});
