import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:login_package/src/business/repository/user_repository.dart';

class IsExistingUser {
  final UserRepository userRepository;

  IsExistingUser({required this.userRepository});

  Future<Either<Failure?, UserEntity?>> call({
    required UserParams params,
  }) async {
    return await userRepository.isUserExisting(params: params);
  }
}
