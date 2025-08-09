import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';

final leaveRepositoryProvider = Provider<LeaveRepository>((ref) {
  final casualLeaveDataSource = ref.read(casualLeaveDataSourceProvider);
  final annualLeaveDataSource = ref.read(annualLeaveDataSourceProvider);

  return LeaveRepositoryImpl(casualLeaveDataSource, annualLeaveDataSource);
});
