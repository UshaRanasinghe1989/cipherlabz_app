class NoParams {}

class TemplateParams {}

class UserParams {
  final String loginId;
  final String password;

  const UserParams({required this.loginId, required this.password});
}

class ScheduleParams {
  final DateTime today;

  const ScheduleParams({required this.today});
}
