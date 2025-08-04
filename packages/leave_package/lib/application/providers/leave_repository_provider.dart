import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';

final leaveRepositoryProvider = Provider<LeaveRepository>((ref) {
  final dataSource = ref.read(leaveDataSourceProvider);
  return LeaveRepositoryImpl(leaveDataSource: dataSource);
});
