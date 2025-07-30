import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/src/business/usecase/get_subordinates_list.dart';
import 'package:user_package/src/business/usecase/get_user.dart';
import 'package:user_package/src/business/usecase/user_usecases.dart';
import 'package:user_package/src/application/providers/user_repository_provider.dart';

final userUseCasesProvider = Provider<UserUseCases>((ref) {
  //REPOSITORY
  final repository = ref.read(userRepositoryProvider);

  return UserUseCases(
    getSubordinatesListUseCase: GetSubordinatesListUseCase(
      repository: repository,
    ),
    getUserUseCase: GetUserUseCase(userRepository: repository),
  );
});
