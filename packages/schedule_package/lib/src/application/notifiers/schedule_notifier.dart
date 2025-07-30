import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedule_package/schedule_package.dart';

class ScheduleNotifier extends Notifier<ScheduleState> {
  late final ScheduleUseCases scheduleUseCases;

  ScheduleEntity? scheduleEntity;

  @override
  ScheduleState build() {
    //GET REFERENCE TO USER USE CASES PROVIDER
    scheduleUseCases = ref.read(scheduleUseCasesProvider);
    return ScheduleState();
  }

  Future<void> getSchedule({required DateTime today}) async {
    //LOADING
    state = state.copyWith(isLoading: true);
    //GET RESULT
    final result = await ref
        .read(scheduleUseCasesProvider)
        .getScheduleUseCase
        .call(params: ScheduleParams(today: today));

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: failure), //FAILD
      (list) => state.copyWith(
        isLoading: false,
        scheduleList: list,
      ), //SUCCESS - USER ENTITY
    );
  }
}
