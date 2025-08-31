import 'package:user_package/user_package.dart';
import 'package:user_profile_package/user_profile_package.dart';

class UserWithReport {
  final UserEntity user;
  final UserProfileReport report;

  UserWithReport({required this.user, required this.report});
}
