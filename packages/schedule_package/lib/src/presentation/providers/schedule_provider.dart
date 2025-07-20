import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:schedule_package/src/data/dummy_data/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
//CORE
import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
//BUSINESS
import 'package:schedule_package/src/business/entity/schedule_entity.dart';
import 'package:schedule_package/src/business/usecase/get_schedule.dart';
//DATA
import 'package:schedule_package/src/data/datasource/schedule_local_datasource/schedule_local_datasource_impl.dart';
import 'package:schedule_package/src/data/repository_impl/schedule_repository_impl.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleEntity> scheduleList = [];
  Failure? failure;
  DateTime today = DateTime.now();

  Future<Either<Failure, List<ScheduleEntity>>>
  eitherFailureOrSchedule() async {
    try {
      final List<ScheduleEntity> result = ScheduleData.scheduleItemsList;

      scheduleList = result;
      failure = null;
      notifyListeners();

      return Right(result);
    } catch (e) {
      NullFailure(
        errorMessage: "errorMessage",
      ); // use your actual Failure class
      scheduleList = [];
      notifyListeners();

      return Left(failure!);
    }
  }

  // Future<Either<Failure, List<ScheduleEntity>>>
  // eitherFailureOrSchedule() async {
  //   ScheduleRepositoryImpl repository = ScheduleRepositoryImpl(
  //     localDataSource: ScheduleLocalDataSourceImpl(
  //       sharedPreferences: await SharedPreferences.getInstance(),
  //     ),

  //remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),

  //networkInfo: NetworkInfoImpl(DataConnectionChecker()),
  //);

  // final failureOrSchedule = await GetSchedule(
  //   scheduleRepository: repository,
  // ).call(params: ScheduleParams(today: today));

  // failureOrSchedule.fold(
  //   (newFailure) {
  //     scheduleList = [];
  //     failure = newFailure;
  //     notifyListeners();
  //   },
  //   (newList) {
  //     scheduleList = newList;
  //     failure = null;
  //     notifyListeners();
  //   },
  // );
  // return failureOrSchedule;
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
