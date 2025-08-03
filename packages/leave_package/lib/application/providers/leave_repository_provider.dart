import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/application/providers/leave_datasource_provider.dart';
import 'package:leave_package/leave_package.dart';

final leaveRepositoryProvider = Provider<LeaveRepository>((ref) {
  final dataSource = ref.read(leaveDataSourceProvider);
  return LeaveRepositoryImpl(leaveDataSource: dataSource);
});
