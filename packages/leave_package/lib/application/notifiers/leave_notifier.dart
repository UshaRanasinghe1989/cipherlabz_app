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
        leaveList: null,
      ),
      (list) => state = state.copyWith(
        isLoading: false,
        failure: null,
        leaveList: list,
      ),
    );
  }

  //SAVE LEAVE REQUEST
  Future<void> saveLeaveRequest({
    required int userId,
    required LeaveTypes leaveType,
    required DateTime fromDate,
    required DateTime toDate,
    String? reason,
    AttachmentEntity? attachment,
  }) async {
    //LOADING
    state = state.copyWith(isLoading: true);
    //GET RESULT
    final Either<Failure, LeaveRequestEntity> result = await _leaveUseCases
        .saveLeaveRequestUseCase
        .call(userId, leaveType, fromDate, toDate, reason, attachment);

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: failure), //FAILD
      (leaveRequest) => state.copyWith(
        isLoading: false,
        leaveRequestEntity: leaveRequest,
      ), //SUCCESS - LEAVE REQUEST ENTITY
    );
  }

  //GET LEAVE REQUESTS BY STATUS
  Future<void> getLeaveRequestsByStatus(
    DateTime fromDate,
    DateTime toDate,
    LeaveRequestStatus leaveRequestStatus,
  ) async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, List<LeaveRequestWithUserEntity>> result =
        await _leaveUseCases.getLeaveRequestsByStatusUseCase.call(
          fromDate,
          toDate,
          leaveRequestStatus,
        );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        leaveWithUserList: null,
      ),
      (list) => state = state.copyWith(
        isLoading: false,
        failure: null,
        leaveWithUserList: list,
      ),
    );
  }
}
