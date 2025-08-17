import 'package:employee_reports_package/employee_reports_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final empReportsUseCasesProvider = Provider<EmployeeReportsUsecases>((ref) {
  final repository = ref.read(subordinateRepositoryProvider);

  return EmployeeReportsUsecases(
    getSubordinateReportsUseCase: GetSubordinateReportsUseCase(
      repository: repository,
    ),
  );
});
