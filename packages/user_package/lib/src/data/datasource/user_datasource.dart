import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user_package/user_package.dart';

class UserDatasource {
  //GET USER ENTITY OBJECT
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    try {
      final userEntity = UserSet.usersSet.firstWhereOrNull(
        (user) => user.loginId == params.loginId,
      );

      if (userEntity != null) {
        return Right(userEntity);
      } else {
        return Left(NullFailure(errorMessage: "Null failure !"));
      }
    } catch (e) {
      return Left(GeneralFailure(errorMessage: e.toString()));
    }
  }

  //GET SUBORDINATE LIST
  Future<Either<Failure, List<int>>> getSubordinateList(int superiorId) async {
    try {
      final subordinateList = ReportToData.reporTotList
          .where((user) => user.superiorId == superiorId)
          .map((user) => user.subordinateId)
          .toList();
      print("subordinateList : $subordinateList");
      return Right(subordinateList);
    } catch (e) {
      return Left(GeneralFailure(errorMessage: e.toString()));
    }
  }
}
