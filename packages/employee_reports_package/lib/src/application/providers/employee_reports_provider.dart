import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subordinateReportNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      SubordinateReportNotifier,
      List<SubordinateReport>
    >(SubordinateReportNotifier.new);
