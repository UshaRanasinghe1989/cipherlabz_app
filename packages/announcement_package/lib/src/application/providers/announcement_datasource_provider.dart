import 'package:announcement_package/src/data/datasource/announcement_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementDataSourceProvider = Provider<AnnouncementDatasource>((ref) {
  return AnnouncementDatasource();
});
