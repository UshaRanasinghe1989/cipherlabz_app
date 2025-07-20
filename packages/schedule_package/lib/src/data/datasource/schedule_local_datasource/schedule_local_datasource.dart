import 'package:schedule_package/src/data/model/schedule_model.dart';

abstract class ScheduleLocalDataSource {
  Future<void>? cacheSchedule(ScheduleModel? scheduleToCache);

  Future<ScheduleModel> getSchedule();
}
