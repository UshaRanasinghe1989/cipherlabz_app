import 'package:core/enum/user_category.dart';

class UserEntity {
  final int id;
  final String email;
  final String name;
  final UserCategory category;
  final String loginId;
  final String jobRole;
  final String password;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.category,
    required this.loginId,
    required this.jobRole,
    required this.password,
  });
}
