import 'package:dartz/dartz.dart';
//CORE
import 'package:core/errors/failure.dart';
//BUSINESS
import 'package:announcement_package/src/business/entity/announcement_entity.dart';
import 'package:announcement_package/src/business/repository/announcement_repository.dart';
//DATA
import 'package:announcement_package/src/data/datasource/announcement_local_datasource/announcement_local_datasource.dart';
import 'package:announcement_package/src/data/dummy_data/dummy_data.dart';

AnnouncementEntity? announcementEntity;

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  final AnnouncementLocalDataSource localDataSource;
  // final UserRemoteDatasource remoteDatasource;
  // final NetworkInfo networkInfo;

  AnnouncementRepositoryImpl({required this.localDataSource});

  // @override
  // Future<Either<Failure, AnnouncementModel>> getAnnouncement() async {
  //   // if (await networkInfo.isConnected!) {
  //   //   try {
  //   //     final remoteUser =
  //   //         await remoteDataSource.getUser(params: params);

  //   //     localDataSource.cacheUser(remoteUser);

  //   //     return Right(remoteUser);
  //   //   } on ServerException {
  //   //     return Left(ServerFailure(errorMessage: 'This is a server exception'));
  //   //   }
  //   // } else {
  //   try {
  //     final localUser = await localDataSource.getAnnouncement();
  //     return Right(localUser);
  //   } on CacheException {
  //     return Left(CacheFailure(errorMessage: 'No local data found'));
  //   }
  //   //}
  // }

  @override
  Future<Either<Failure?, List<AnnouncementEntity>>> getAnnouncement() async {
    try {
      List<AnnouncementEntity> list = AnnouncementData.announcementsList;
      print("${list.length}**********");
      if (list.isNotEmpty) {
        return Right(list);
      } else {
        return Left(NullFailure(errorMessage: "No announcements found!"));
      }
    } catch (e) {
      return Left(NullFailure(errorMessage: "No announcements found !"));
    }
  }
}
