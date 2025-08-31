import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_package/user_profile_package.dart';

final userProfileReportsUseCasesProvider = Provider<UserProfileReportsUsecases>(
  (ref) {
    final repository = ref.read(userProfileReportRepositoryProvider);

    return UserProfileReportsUsecases(
      getUserProfileReportsUseCase: GetUserProfileReportsUseCase(
        repository: repository,
      ),
    );
  },
);
