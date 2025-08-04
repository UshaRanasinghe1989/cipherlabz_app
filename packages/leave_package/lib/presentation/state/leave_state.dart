import 'package:core/core.dart';
import 'package:leave_package/business/entity/leave_request_entity.dart';

class LeaveState {
  final bool isLoading;
  final Failure? failure;
  final List<LeaveRequestEntity>? myLeaveList;

  LeaveState({this.isLoading = false, this.failure, this.myLeaveList});

  LeaveState copyWith({
    bool? isLoading,
    Failure? failure,
    List<LeaveRequestEntity>? myLeaveList,
  }) {
    return LeaveState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      myLeaveList: myLeaveList ?? this.myLeaveList,
    );
  }
}
