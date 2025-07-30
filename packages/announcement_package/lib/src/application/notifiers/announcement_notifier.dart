import 'package:announcement_package/announcement_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnouncementNotifier extends Notifier<AnnouncementState> {
  late final AnnouncementUseCases announcementUseCases;

  AnnouncementEntity? announcementEntity;

  @override
  AnnouncementState build() {
    //GET REFERENCE TO USER USE CASES PROVIDER
    announcementUseCases = ref.read(announcementUseCasesProvider);
    return AnnouncementState();
  }

  Future<void> getAnnouncements() async {
    //LOADING
    state = state.copyWith(isLoading: true);
    //GET RESULT
    final result = await ref
        .read(announcementUseCasesProvider)
        .getAnnouncementsUseCase
        .call();

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: failure), //FAILD
      (list) => state.copyWith(
        isLoading: false,
        announcementList: list,
      ), //SUCCESS - USER ENTITY
    );
  }
}
