import 'package:core/errors/failure.dart';
import 'package:user_package/user_package.dart';

class LoginState {
  final UserEntity? user;
  final bool isLoading;
  final Failure? failure;

  LoginState({this.user, this.isLoading = false, this.failure});

  LoginState copyWith({UserEntity? user, bool? isLoading, Failure? failure}) {
    return LoginState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
    );
  }
}
