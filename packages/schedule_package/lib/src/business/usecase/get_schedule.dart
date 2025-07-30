import 'package:dartz/dartz.dart';
//CORE
import 'package:core/core.dart';
//BUSINESS
import 'package:schedule_package/src/business/entity/schedule_entity.dart';
import 'package:schedule_package/src/business/repository/schedule_repository.dart';

class GetScheduleUseCase {
  final ScheduleRepository scheduleRepository;

  GetScheduleUseCase({required this.scheduleRepository});

  Future<Either<Failure, List<ScheduleEntity>>> call({
    required ScheduleParams params,
  }) async {
    return await scheduleRepository.getSchedule(params: params);
  }
}
