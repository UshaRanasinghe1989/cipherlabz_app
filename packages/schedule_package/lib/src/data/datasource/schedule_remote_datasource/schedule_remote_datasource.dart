import 'package:core/params/params.dart';
//DATA
import 'package:schedule_package/src/data/model/schedule_model.dart';

abstract class ScheduleRemoteDatasource {
  Future<ScheduleModel> getUser({required ScheduleParams ScheduleParams});
}
