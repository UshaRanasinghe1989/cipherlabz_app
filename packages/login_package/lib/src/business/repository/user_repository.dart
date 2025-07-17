import 'package:dartz/dartz.dart';
import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:core/core.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({
    //Either from dartz: ^0.10.1
    required UserParams params,
  });

  //CHECK THE USER EXISTANCE
  Future<Either<Failure?, UserEntity?>> isUserExisting({
    required UserParams params,
  });
}
