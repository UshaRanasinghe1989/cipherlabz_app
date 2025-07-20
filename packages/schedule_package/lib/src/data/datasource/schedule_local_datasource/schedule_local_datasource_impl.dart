import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/errors/exceptions.dart';
//DATA
import 'package:schedule_package/src/data/datasource/schedule_local_datasource/schedule_local_datasource.dart';
import 'package:schedule_package/src/data/model/schedule_model.dart';

const cachedSchedule = 'CACHED_SCHEDULE';

class ScheduleLocalDataSourceImpl implements ScheduleLocalDataSource {
  final SharedPreferences sharedPreferences;

  ScheduleLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheSchedule(scheduleToCache) async {
    if (scheduleToCache != null) {
      sharedPreferences.setString(
        cachedSchedule,
        json.encode(scheduleToCache.toJson()),
      );
    }
    throw CacheException();
  }

  @override
  Future<ScheduleModel> getSchedule() {
    final jsonString = sharedPreferences.getString(cachedSchedule);

    if (jsonString != null) {
      return Future.value(ScheduleModel.fromJson(json.decode(jsonString)));
    }
    throw CacheException();
  }
}
