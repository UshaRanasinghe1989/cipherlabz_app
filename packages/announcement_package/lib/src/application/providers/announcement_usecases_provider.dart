import 'package:announcement_package/announcement_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementUseCasesProvider = Provider<AnnouncementUseCases>((ref) {
  final repository = ref.read(announcementRepositoryProvider);

  return AnnouncementUseCases(
    getAnnouncementsUseCase: GetAnnouncementsUseCase(repository: repository),
  );
});
