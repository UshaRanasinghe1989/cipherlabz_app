import 'package:core/errors/failure.dart';
import 'package:core/params/params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_package/user_package.dart';

class LoginDatasource {
  //USER LOGIN
  Future<Either<Failure?, UserEntity?>> userLogin({
    required UserParams params,
  }) async {
    try {
      UserEntity user = UserSet.usersSet.firstWhere(
        (u) =>
            u.loginId.trim().toLowerCase() ==
                params.loginId.trim().toLowerCase() &&
            u.password.trim() == params.password.trim(),
      );
      return Right(user); // successful case
    } catch (e) {
      return Left(
        NullFailure(errorMessage: "User Not Existing !"),
      ); // failure case
    }
  }
}

final loginDataSourceProvider = Provider<LoginDatasource>((ref) {
  return LoginDatasource();
});
