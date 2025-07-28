import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:user_package/user_package.dart';

//GET SUBORDINATES LIST
class GetSubordinatesListUseCase {
  final UserRepository repository;

  GetSubordinatesListUseCase({required this.repository});

  Future<Either<Failure, List<int>>> call(int superiorId) async {
    return await repository.getSubordinateList(superiorId);
  }
}
