import 'package:announcement_package/announcement_package.dart';
import 'package:announcement_package/src/application/providers/announcement_datasource_provider.dart';
import 'package:announcement_package/src/data/repository_impl/announcement_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementRepositoryProvider = Provider<AnnouncementRepository>((ref) {
  final dataSource = ref.watch(announcementDataSourceProvider);

  return AnnouncementRepositoryImpl(datasource: dataSource);
});
