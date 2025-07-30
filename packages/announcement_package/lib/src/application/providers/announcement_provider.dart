import 'package:announcement_package/announcement_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementProvider =
    NotifierProvider<AnnouncementNotifier, AnnouncementState>(
      () => AnnouncementNotifier(),
    );
