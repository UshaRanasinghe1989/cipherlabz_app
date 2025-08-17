import 'package:attendance_package/attendance_package.dart';
import 'package:core/errors/failure.dart';
import 'package:employee_reports_package/employee_reports_package.dart';

class SubordinateReportState {
  final bool isLoading;
  final Failure? failure;
  final SubordinateReport? subordinateReport;

  SubordinateReportState({
    this.isLoading = false,
    this.failure,
    this.subordinateReport,
  });

  SubordinateReportState copyWith({
    bool? isLoading,
    Failure? failure,
    SubordinateReport? subordinateReport,
  }) {
    return SubordinateReportState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure,
      subordinateReport: subordinateReport ?? this.subordinateReport,
    );
  }
}
