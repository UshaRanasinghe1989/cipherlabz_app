import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

class UserNotifier extends Notifier<UserState> {
  late final UserUseCases userUseCases;

  @override
  UserState build() {
    // You can use ref.watch(...) here to get useCases
    userUseCases = ref.watch(userUseCasesProvider);
    return UserState();
  }

  //GET SUBORDINATE LIST
  Future<void> getSubordinateList(int superiorId) async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, List<int>> result = await userUseCases
        .getSubordinatesListUseCase
        .call(superiorId);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        subordinateList: null,
      ),
      (list) => state = state.copyWith(
        isLoading: false,
        failure: null,
        subordinateList: list,
      ),
    );
  }

  //FETCH USER
  Future<void> getUser(UserParams params) async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, UserEntity> result = await userUseCases.getUserUseCase
        .call(params: params);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        user: null,
      ),
      (entity) =>
          state = state.copyWith(isLoading: false, failure: null, user: entity),
    );
  }
}
