import 'package:dartz/dartz.dart';
//RESOURCES
import 'package:core/core.dart';
//PACKAGES
import 'package:user_package/user_package.dart';

class GetEmployeeUseCase {
  final UserRepository userRepository;

  GetEmployeeUseCase({required this.userRepository});

  Future<Either<Failure, UserEntity>> call({required userId}) async {
    return await userRepository.getEmployee(userId);
  }
}
