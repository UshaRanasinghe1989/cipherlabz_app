import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

final userUseCasesProvider = Provider<UserUseCases>((ref) {
  //REPOSITORY
  final repository = ref.read(userRepositoryProvider);

  return UserUseCases(
    getSubordinatesListUseCase: GetSubordinatesListUseCase(
      repository: repository,
    ),
    getUserUseCase: GetUserUseCase(userRepository: repository),
    getEmployeeUseCase: GetEmployeeUseCase(userRepository: repository),
  );
});
