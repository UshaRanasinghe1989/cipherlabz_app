class NoParams {}

class TemplateParams {}

enum UserCategory { superUser, regularUser }

class UserParams {
  final String loginId;
  final String password;

  const UserParams({required this.loginId, required this.password});
}

class ScheduleParams {
  final DateTime today;

  const ScheduleParams({required this.today});
}
