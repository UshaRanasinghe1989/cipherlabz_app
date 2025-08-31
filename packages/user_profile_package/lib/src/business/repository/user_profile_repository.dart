import 'package:user_profile_package/src/business/entity/user_profile_report.dart';

abstract class UserProfileRepository {
  //FETCH USER PROFILE REPORT
  Future<UserProfileReport> fetchUserProfileReport(DateTime today);
}
