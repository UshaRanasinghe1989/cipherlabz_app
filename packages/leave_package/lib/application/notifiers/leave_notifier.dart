import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';

class LeaveNotifier extends Notifier<LeaveState> {
  late final LeaveUsecases _leaveUseCases = ref.read(leaveUseCasesProvider);

  @override
  build() {
    return LeaveState();
  }

  //GET MY LEAVE REQUESTS
  Future<void> getMyLeaveRequests(int userId) async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, List<LeaveRequestEntity>> result =
        await _leaveUseCases.getMyLeaveRequestsUseCase.call(userId);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        myLeaveList: null,
      ),
      (list) => state = state.copyWith(
        isLoading: false,
        failure: null,
        myLeaveList: list,
      ),
    );
  }
}
