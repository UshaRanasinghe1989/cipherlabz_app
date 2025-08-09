import 'package:core/core.dart';
import 'package:leave_package/leave_package.dart';

class LeaveState {
  final bool isLoading;
  final Failure? failure;
  final LeaveRequestEntity? leaveRequestEntity;
  final List<LeaveRequestEntity>? myLeaveList;
  final List<CasualLeaveRequestEntity>? casualLeaveRequestList;
  final List<AnnualLeaveRequestEntity>? annualLeaveRequestList;

  LeaveState({
    this.isLoading = false,
    this.failure,
    this.leaveRequestEntity,
    this.myLeaveList,
    this.casualLeaveRequestList,
    this.annualLeaveRequestList,
  });

  LeaveState copyWith({
    bool? isLoading,
    Failure? failure,
    LeaveRequestEntity? leaveRequestEntity,
    List<LeaveRequestEntity>? myLeaveList,
    List<CasualLeaveRequestEntity>? casualLeaveRequestList,
    List<AnnualLeaveRequestEntity>? annualLeaveRequestList,
  }) {
    return LeaveState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      leaveRequestEntity: leaveRequestEntity,
      myLeaveList: myLeaveList ?? this.myLeaveList,
      casualLeaveRequestList:
          casualLeaveRequestList ?? this.casualLeaveRequestList,
      annualLeaveRequestList:
          annualLeaveRequestList ?? this.annualLeaveRequestList,
    );
  }
}
