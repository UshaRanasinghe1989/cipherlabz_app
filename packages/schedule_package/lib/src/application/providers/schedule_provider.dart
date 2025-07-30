import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedule_package/schedule_package.dart';

final scheduleProvider = NotifierProvider<ScheduleNotifier, ScheduleState>(
  () => ScheduleNotifier(),
);
