import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';

final annualLeaveDataSourceProvider = Provider<AnnualLeaveDatasource>((ref) {
  return AnnualLeaveDatasourceImpl();
});
