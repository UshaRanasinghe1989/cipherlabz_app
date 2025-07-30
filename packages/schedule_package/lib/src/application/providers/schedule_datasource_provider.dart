import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedule_package/src/data/datasource/schedule_datasour.dart';

final scheduleDataSourceProvider = Provider<ScheduleDataSource>((ref) {
  return ScheduleDataSource();
});
