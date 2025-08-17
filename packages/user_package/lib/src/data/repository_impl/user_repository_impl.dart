import 'package:dartz/dartz.dart';
//RESOURCES
import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
//import 'package:login_package/src/data/datasource/user_remote_datasource/user_remote_datasource.dart';
//PACKAGE
import 'package:user_package/user_package.dart';

//UserEntity? user;

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;
  //final UserLocalDataSource localDataSource;
  // final UserRemoteDatasource remoteDatasource;
  // final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.datasource /*required this.localDataSource*/,
  });

  //GET USER ENTITY OBJECT
  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    return await datasource.getUser(params: params);
  }

  //GET SUBORDINATES LIST
  @override
  Future<Either<Failure, List<int>>> getSubordinateList(int superiorId) async {
    return await datasource.getSubordinateList(superiorId);
  }

  @override
  Future<Either<Failure, UserEntity>> getEmployee(int userId) async {
    return await datasource.getEmployee(userId: userId);
  }

  // @override
  // Future<Either<Failure, UserModel>> getUser({
  //   required UserParams params,
  // }) async {
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
  //   try {
  //     final localUser = await localDataSource.getLastUser();
  //     return Right(localUser);
  //   } on CacheException {
  //     return Left(CacheFailure(errorMessage: 'No local data found'));
  //   }
  //   //}
  // }
}
