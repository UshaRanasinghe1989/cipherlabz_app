import 'package:dartz/dartz.dart';
//RESOURCES
import 'package:core/core.dart';
//PACKAGES
import 'package:user_package/user_package.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<Either<Failure, UserEntity>> call({required UserParams params}) async {
    return await userRepository.getUser(params: params);
  }
}
