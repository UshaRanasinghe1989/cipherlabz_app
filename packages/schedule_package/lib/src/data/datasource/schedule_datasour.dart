import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:schedule_package/src/data/dummy_data/dummy_data.dart';
import 'package:schedule_package/src/data/model/schedule_model.dart';

class ScheduleDataSource {
  Future<Either<Failure, List<ScheduleModel>>> getSchedule(
    ScheduleParams params,
  ) async {
    final localScheduleList = ScheduleData.scheduleItemsList;

    if (localScheduleList.isNotEmpty) {
      return Right(localScheduleList);
    } else {
      return Left(GeneralFailure(errorMessage: "Error"));
    }
  }
}
