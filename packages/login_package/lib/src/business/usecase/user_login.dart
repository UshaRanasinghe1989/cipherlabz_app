import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';

class UserLoginUseCase {
  final LoginRepository loginRepository;

  UserLoginUseCase({required this.loginRepository});

  Future<Either<Failure?, UserEntity?>> call({
    required UserParams params,
  }) async {
    return await loginRepository.userLogin(params: params);
  }
}

final loginUseCaseProvider = Provider<UserLoginUseCase>((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return UserLoginUseCase(loginRepository: repository);
});
