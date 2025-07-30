import 'package:core/errors/failure.dart';
import 'package:user_package/user_package.dart';

class UserState {
  final bool? isLoading;
  final Failure? failure;
  final UserEntity? user;
  final List<int>? subordinateList;

  UserState({
    this.isLoading = false,
    this.failure,
    this.user,
    this.subordinateList,
  });

  UserState copyWith({
    bool? isLoading,
    Failure? failure,
    UserEntity? user,
    List<int>? subordinateList,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      user: user ?? this.user,
      subordinateList: subordinateList ?? this.subordinateList,
    );
  }
}
