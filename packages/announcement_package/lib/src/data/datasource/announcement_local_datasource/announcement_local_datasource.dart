import 'package:announcement_package/src/data/model/announcement_model.dart';

abstract class AnnouncementLocalDataSource {
  Future<void>? cacheAnnouncement(AnnouncementModel? announcementToCache);

  Future<AnnouncementModel> getAnnouncement();
}
