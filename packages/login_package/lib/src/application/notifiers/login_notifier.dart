import 'dart:async';
import 'package:core/params/params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';

class LoginNotifier extends Notifier<LoginState> {
  late final UserUseCases userUseCases;

  UserEntity? user;

  @override
  LoginState build() {
    //GET REFERENCE TO USER USE CASES PROVIDER
    userUseCases = ref.read(userUseCasesProvider);
    return LoginState();
  }

  Future<void> login({required String email, required String password}) async {
    //LOADING
    state = state.copyWith(isLoading: true);
    //GET RESULT
    final result = await ref
        .read(loginUseCaseProvider)
        .call(
          params: UserParams(loginId: email, password: password),
        );

    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: failure), //FAILD
      (user) =>
          state.copyWith(isLoading: false, user: user), //SUCCESS - USER ENTITY
    );
  }

  void logout() {
    state = LoginState(); // reset
  }
}
