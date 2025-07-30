import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedule_package/src/application/providers/schedule_datasource_provider.dart';
import 'package:schedule_package/src/business/repository/schedule_repository.dart';
import 'package:schedule_package/src/data/repository_impl/schedule_repository_impl.dart';

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final dataSource = ref.read(scheduleDataSourceProvider);
  return ScheduleRepositoryImpl(scheduleDataSource: dataSource);
});
