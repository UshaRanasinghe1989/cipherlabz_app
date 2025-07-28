import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:user_package/user_package.dart';

abstract class UserRepository {
  // Future<Either<Failure, UserEntity>> getUser({
  //   //Either from dartz: ^0.10.1
  //   required UserParams params,
  // });
  //GET USER ENTITY FOR USER ID AND PASSWORD
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
  //GET SUBORDINATES LIST
  Future<Either<Failure, List<int>>> getSubordinateList(int superiorId);
}
