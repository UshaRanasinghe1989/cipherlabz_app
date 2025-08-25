import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';

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
