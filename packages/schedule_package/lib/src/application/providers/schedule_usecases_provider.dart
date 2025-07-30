import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedule_package/schedule_package.dart';

final scheduleUseCasesProvider = Provider<ScheduleUseCases>((ref) {
  final repository = ref.read(scheduleRepositoryProvider);

  return ScheduleUseCases(
    getScheduleUseCase: GetScheduleUseCase(scheduleRepository: repository),
  );
});
