import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leave_package/leave_package.dart';
import 'package:logger/web.dart';
import 'package:login_package/login_package.dart';
import 'package:user_package/user_package.dart';

class EmployeeHistoryListWidget extends ConsumerStatefulWidget {
  const EmployeeHistoryListWidget({super.key});

  @override
  ConsumerState<EmployeeHistoryListWidget> createState() =>
      _EmployeeHistoryListWidgetState();
}

class _EmployeeHistoryListWidgetState
    extends ConsumerState<EmployeeHistoryListWidget> {
  final logger = Logger();
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final loginState = ref.read(loginProvider);
    //   final user = loginState.user;

    //   if (user != null) {
    //     final superiorId = user.id;
    //     ref.read(userProvider.notifier).getSubordinateList(superiorId);
    //     final subordinatesList = ref.read(userProvider).subordinateList ?? [];
    //     logger.i("Subordinates list: $subordinatesList");
    //     // Example date range (this year)
    //     final now = DateTime.now();
    //     final fromDate = DateTime(now.year, 1, 1);
    //     final toDate = DateTime(now.year, 12, 31);

    //     // Trigger subordinate reports fetch
    //     ref
    //         .read(subordinateReportNotifierProvider.notifier)
    //         .loadReports(
    //           subordinatesList: subordinatesList,
    //           fromDate: fromDate,
    //           toDate: toDate,
    //           leaveRequestStatus: LeaveRequestStatus.approved,
    //         );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    //GET SUBORDINATE REPORT
    final reportState = ref.watch(subordinateReportNotifierProvider);

    return reportState.when(
      data: (reports) {
        if (reports.isEmpty) {
          return const Center(child: Text("No reports available"));
        }
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              return EmployeeHistoryCard(report: report);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
