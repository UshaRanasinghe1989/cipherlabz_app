import 'package:user_package/user_package.dart';

class UserUseCases {
  final GetSubordinatesListUseCase getSubordinatesListUseCase;
  final GetUserUseCase getUserUseCase;
  final GetEmployeeUseCase getEmployeeUseCase;
  UserUseCases({
    required this.getSubordinatesListUseCase,
    required this.getUserUseCase,
    required this.getEmployeeUseCase,
  });
}
