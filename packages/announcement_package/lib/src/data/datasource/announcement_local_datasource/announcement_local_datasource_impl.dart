import 'dart:convert';

import 'package:announcement_package/src/data/datasource/announcement_local_datasource/announcement_local_datasource.dart';
import 'package:announcement_package/src/data/model/announcement_model.dart';
import 'package:core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedAnnouncement = 'CACHED_ANNOUNCEMENT';

class AnnouncementLocalDataSourceImpl implements AnnouncementLocalDataSource {
  final SharedPreferences sharedPreferences;

  AnnouncementLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void>? cacheAnnouncement(announcementToCache) async {
    if (announcementToCache != null) {
      sharedPreferences.setString(
        cachedAnnouncement,
        json.encode(announcementToCache.toJson()),
      );
    }
    throw CacheException();
  }

  @override
  Future<AnnouncementModel> getAnnouncement() {
    final jsonString = sharedPreferences.getString(cachedAnnouncement);

    if (jsonString != null) {
      return Future.value(AnnouncementModel.fromJson(json.decode(jsonString)));
    }
    throw CacheException();
  }
}
