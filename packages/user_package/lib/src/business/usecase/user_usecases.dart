import 'package:user_package/src/business/usecase/get_user.dart';
import 'package:user_package/user_package.dart';

class UserUseCases {
  final GetSubordinatesListUseCase getSubordinatesListUseCase;
  final GetUserUseCase getUserUseCase;
  UserUseCases({
    required this.getSubordinatesListUseCase,
    required this.getUserUseCase,
  });
}
