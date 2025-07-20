//PACKAGES
import 'package:announcement_package/src/data/model/announcement_model.dart';

abstract class AnnouncementRemoteDatasource {
  Future<AnnouncementModel> getAnnouncement();
}
