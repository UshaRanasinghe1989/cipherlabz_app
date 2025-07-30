import 'package:dartz/dartz.dart';
//CORE
import 'package:core/errors/exceptions.dart';
import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
//BUSINESS
import 'package:schedule_package/src/business/entity/schedule_entity.dart';
import 'package:schedule_package/src/business/repository/schedule_repository.dart';
import 'package:schedule_package/src/data/datasource/schedule_datasour.dart';
//DATA
import 'package:schedule_package/src/data/datasource/schedule_local_datasource/schedule_local_datasource.dart';
import 'package:schedule_package/src/data/dummy_data/dummy_data.dart';
import 'package:schedule_package/src/data/model/schedule_model.dart';

ScheduleEntity? scheduleEntity;

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource scheduleDataSource;
  //final ScheduleLocalDataSource localDataSource;
  // final UserRemoteDatasource remoteDatasource;
  // final NetworkInfo networkInfo;

  ScheduleRepositoryImpl({required this.scheduleDataSource});

  @override
  Future<Either<Failure, List<ScheduleModel>>> getSchedule({
    required ScheduleParams params,
  }) async {
    return scheduleDataSource.getSchedule(params);
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
    // try {
    //   //final localSchedule = await localDataSource.getSchedule();
    //   //final localSchedule = ScheduleData.scheduleItemsList;
    //   return Right(localSchedule);
    // } on CacheException {
    //   return Left(CacheFailure(errorMessage: 'No local data found'));
    // }
    //}
  }
}
