import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
//BUSINESS
import 'package:login_package/src/business/entity/user_entity.dart';
import 'package:login_package/src/business/usecase/is_existing_user.dart';
//DATA
import 'package:login_package/src/data/datasource/user_local_datasource/user_local_datasource_impl.dart';
import 'package:login_package/src/data/repository_impl/user_repository_impl.dart';

class LoginProvider extends ChangeNotifier {
  UserEntity? user;
  Failure? failure;

  LoginProvider({required this.user, required this.failure});

  Future<Either<Failure?, UserEntity?>> eitherFailureOrLogin({
    required String email,
    required String password,
  }) async {
    UserRepositoryImpl repository = UserRepositoryImpl(
      localDataSource: UserLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),

      //remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),

      //networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrUser = await IsExistingUser(userRepository: repository).call(
      params: UserParams(loginId: email, password: password),
    );

    failureOrUser.fold(
      (newFailure) {
        user = null;
        failure = newFailure;
        notifyListeners();
      },
      (newUser) {
        user = newUser;
        failure = null;
        notifyListeners();
      },
    );
    return failureOrUser;
  }

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
