import 'package:announcement_package/announcement_package.dart';
import 'package:core/errors/failure.dart';

class AnnouncementState {
  final List<AnnouncementEntity>? announcementList;
  final bool? isLoading;
  final Failure? failure;

  AnnouncementState({
    this.announcementList,
    this.isLoading = false,
    this.failure,
  });

  AnnouncementState copyWith({
    List<AnnouncementEntity>? announcementList,
    bool? isLoading,
    Failure? failure,
  }) {
    return AnnouncementState(
      announcementList: announcementList ?? this.announcementList,
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
    );
  }
}
