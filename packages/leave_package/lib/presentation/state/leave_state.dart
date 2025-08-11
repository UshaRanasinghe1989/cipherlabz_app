import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';

class LeaveState {
  final bool isLoading;
  final Failure? failure;
  final LeaveRequestEntity? leaveRequestEntity;
  final List<LeaveRequestEntity>? leaveList;
  final List<LeaveRequestWithUserEntity>? leaveWithUserList;
  final List<CasualLeaveRequestEntity>? casualLeaveRequestList;
  final List<AnnualLeaveRequestEntity>? annualLeaveRequestList;

  LeaveState({
    this.isLoading = false,
    this.failure,
    this.leaveRequestEntity,
    this.leaveList,
    this.leaveWithUserList,
    this.casualLeaveRequestList,
    this.annualLeaveRequestList,
  });

  LeaveState copyWith({
    bool? isLoading,
    Failure? failure,
    LeaveRequestEntity? leaveRequestEntity,
    List<LeaveRequestEntity>? leaveList,
    List<LeaveRequestWithUserEntity>? leaveWithUserList,
    List<CasualLeaveRequestEntity>? casualLeaveRequestList,
    List<AnnualLeaveRequestEntity>? annualLeaveRequestList,
  }) {
    return LeaveState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      leaveRequestEntity: leaveRequestEntity,
      leaveList: leaveList ?? this.leaveList,
      leaveWithUserList: leaveWithUserList ?? this.leaveWithUserList,
      casualLeaveRequestList:
          casualLeaveRequestList ?? this.casualLeaveRequestList,
      annualLeaveRequestList:
          annualLeaveRequestList ?? this.annualLeaveRequestList,
    );
  }
}
