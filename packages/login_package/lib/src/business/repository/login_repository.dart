import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'package:user_package/user_package.dart';

abstract class LoginRepository {
  //USER LOGIN
  Future<Either<Failure?, UserEntity?>> userLogin({required UserParams params});
}
