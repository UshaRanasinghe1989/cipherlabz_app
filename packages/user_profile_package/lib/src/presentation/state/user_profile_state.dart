import 'package:core/core.dart';
import 'package:user_profile_package/user_profile_package.dart';

class UserProfileReportState {
  final bool isLoading;
  final Failure? failure;
  final UserProfileReport? userProfileReport;

  UserProfileReportState({
    this.isLoading = false,
    this.failure,
    this.userProfileReport,
  });

  UserProfileReportState copyWith({
    bool? isLoading,
    Failure? failure,
    UserProfileReport? userProfileReport,
  }) {
    return UserProfileReportState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      userProfileReport: userProfileReport ?? this.userProfileReport,
    );
  }
}
