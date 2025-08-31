import 'package:user_profile_package/user_profile_package.dart';

class GetUserProfileReportsUseCase {
  final UserProfileRepository repository;

  GetUserProfileReportsUseCase({required this.repository});

  Future<UserProfileReport> call(DateTime today) async {
    return await repository.fetchUserProfileReport(today);
  }
}
