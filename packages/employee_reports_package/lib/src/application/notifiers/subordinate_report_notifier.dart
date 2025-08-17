import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/logger.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';

class SubordinateReportNotifier
    extends AutoDisposeAsyncNotifier<List<SubordinateReport>> {
  final logger = Logger();
  final now = DateTime.now();

  late final EmployeeReportsUsecases employeeReportsUsecases = ref.read(
    empReportsUseCasesProvider,
  );

  @override
  Future<List<SubordinateReport>> build() async {
    final loginState = ref.watch(loginProvider);
    final user = loginState.user;

    if (user == null) {
      logger.i("User not loaded yet");
      return [];
    }

    // Delay fetching subordinates until after build
    Future.microtask(() async {
      await _fetchSubordinateReports(user.id);
    });

    return []; // build immediately returns an empty list
  }

  Future<void> _fetchSubordinateReports(int superiorId) async {
    // Fetch subordinate list asynchronously
    await ref
        .read(userProvider.notifier)
        .getSubordinateList(superiorId); // make this async

    final subordinatesList = ref.watch(userProvider).subordinateList;

    if (subordinatesList == null) return;

    final result = await employeeReportsUsecases.getSubordinateReportsUseCase
        .call(
          subordinatesList,
          DateTime(now.year, 1, 1),
          DateTime(now.year, 12, 31),
          LeaveRequestStatus.approved,
        );

    state = result.fold(
      (failure) {
        logger.e("Failed to load reports: $failure");
        return AsyncError(failure, StackTrace.current);
      },
      (reports) {
        logger.i("Loaded ${reports.length} reports");
        return AsyncData(reports);
      },
    );
  }
}
