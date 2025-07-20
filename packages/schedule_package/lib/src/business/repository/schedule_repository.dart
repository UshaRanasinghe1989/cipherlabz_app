import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:schedule_package/src/business/entity/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, List<ScheduleEntity>>> getSchedule({
    //Either from dartz: ^0.10.1
    required ScheduleParams params,
  });
}
