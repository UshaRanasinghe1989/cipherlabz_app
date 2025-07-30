import 'package:core/errors/failure.dart';
import 'package:schedule_package/schedule_package.dart';

class ScheduleState {
  final List<ScheduleEntity>? scheduleList;
  final bool? isLoading;
  final Failure? failure;

  ScheduleState({this.scheduleList, this.isLoading = false, this.failure});

  ScheduleState copyWith({
    List<ScheduleEntity>? scheduleList,
    bool? isLoading,
    Failure? failure,
  }) {
    return ScheduleState(
      scheduleList: scheduleList ?? this.scheduleList,
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
    );
  }
}
