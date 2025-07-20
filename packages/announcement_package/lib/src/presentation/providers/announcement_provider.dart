import 'package:announcement_package/src/data/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
//RESOURCES
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/errors/failure.dart';
//BUSINESS
import 'package:announcement_package/src/business/entity/announcement_entity.dart';
import 'package:announcement_package/src/business/usecase/get_announcements.dart';
//DATA
import 'package:announcement_package/src/data/repository_impl/announcement_repository_impl.dart';
import 'package:announcement_package/src/data/datasource/announcement_local_datasource/announcement_local_datasource_impl.dart';

class AnnouncementProvider extends ChangeNotifier {
  List<AnnouncementEntity> announcementList = [];
  Failure? failure;

  Future<Either<Failure, List<AnnouncementEntity>>>
  eitherFailureOrAnnouncement() async {
    try {
      final List<AnnouncementEntity> result =
          AnnouncementData.announcementsList;

      announcementList = result;
      failure = null;
      notifyListeners();

      return Right(result);
    } catch (e) {
      NullFailure(
        errorMessage: "errorMessage",
      ); // use your actual Failure class
      announcementList = [];
      notifyListeners();

      return Left(failure!);
    }
  }
  // Future<Either<Failure?, List<AnnouncementEntity>>>
  // eitherFailureOrAnnouncement() async {
  //   AnnouncementRepositoryImpl repository = AnnouncementRepositoryImpl(
  //     localDataSource: AnnouncementLocalDataSourceImpl(
  //       sharedPreferences: await SharedPreferences.getInstance(),
  //     ),

  //remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),

  //networkInfo: NetworkInfoImpl(DataConnectionChecker()),
  //);

  // final failureOrAnnouncements = await GetAnnouncements(
  //   repository: repository,
  // ).call();

  // failureOrAnnouncements.fold(
  //   (newFailure) {
  //     announcementList = [];
  //     failure = newFailure;
  //     notifyListeners();
  //   },
  //   (newList) {
  //     announcementList = newList;
  //     failure = null;
  //     notifyListeners();
  //   },
  // );
  // return failureOrAnnouncements;
  //}

  // PokemonEntity? pokemon;
  // Failure? failure;

  // PokemonProvider({
  //   this.pokemon,
  //   this.failure,
  // });

  // void eitherFailureOrPokemon({
  //   required String value,
  // }) async {
  //   PokemonRepositoryImpl repository = PokemonRepositoryImpl(
  //     remoteDataSource: PokemonRemoteDataSourceImpl(dio: Dio()),
  //     localDataSource: PokemonLocalDataSourceImpl(
  //         sharedPreferences: await SharedPreferences.getInstance()),
  //     networkInfo: NetworkInfoImpl(DataConnectionChecker()),
  //   );

  //   final failureOrPokemon = await GetPokemon(repository).call(
  //     params: PokemonParams(id: value),
  //   );

  //   failureOrPokemon.fold(
  //     (newFailure) {
  //       pokemon = null;
  //       failure = newFailure;
  //       notifyListeners();
  //     },
  //     (newPokemon) {
  //       pokemon = newPokemon;
  //       failure = null;
  //       notifyListeners();
  //     },
  //   );
  // }

  //GET USER OBJECT
  // User getUser(String loginId, String password) {
  //   return usersSet.firstWhere(
  //     (u) => u.loginId == loginId && u.password == password,
  //   );
  // }
}
