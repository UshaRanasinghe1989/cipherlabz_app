import 'package:core/errors/exceptions.dart';
import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:login_package/src/business/repository/user_repository.dart';
import 'package:login_package/src/data/datasource/user_local_datasource/user_local_datasource.dart';
//import 'package:login_package/src/data/datasource/user_remote_datasource/user_remote_datasource.dart';
import 'package:login_package/src/data/model/user_model.dart';

import 'package:login_package/src/data/dummy_data/user_set.dart';

UserEntity? user;

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  // final UserRemoteDatasource remoteDatasource;
  // final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, UserModel>> getUser({
    required UserParams params,
  }) async {
    // if (await networkInfo.isConnected!) {
    //   try {
    //     final remoteUser =
    //         await remoteDataSource.getUser(params: params);

    //     localDataSource.cacheUser(remoteUser);

    //     return Right(remoteUser);
    //   } on ServerException {
    //     return Left(ServerFailure(errorMessage: 'This is a server exception'));
    //   }
    // } else {
    try {
      final localUser = await localDataSource.getLastUser();
      return Right(localUser);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'No local data found'));
    }
    //}
  }

  @override
  Future<Either<Failure?, UserEntity?>> isUserExisting({
    required UserParams params,
  }) async {
    try {
      user = UserSet.usersSet.firstWhere(
        (u) =>
            u.loginId.trim().toLowerCase() ==
                params.loginId.trim().toLowerCase() &&
            u.password.trim() == params.password.trim(),
      );
      return Right(user); // successful case
    } catch (e) {
      return Left(null); // failure case
    }
  }
}
