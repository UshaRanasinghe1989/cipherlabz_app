import 'package:attendance_package/attendance_package.dart';
import 'package:attendance_package/src/application/providers/local_auth_provider.dart';
import 'package:attendance_package/src/application/providers/location_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceUseCasesProvider = Provider<AttendanceUseCases>((ref) {
  final repository = ref.read(attendanceRepositoryProvider);
  final localAuth = ref.read(localAuthProvider);
  final currentLocation = ref.read(locationProvider);

  return AttendanceUseCases(
    getAttendanceObj: GetAttendanceUseCase(repository: repository),
    saveAttendance: SaveAttendanceUseCase(
      repository,
      localAuth,
      currentLocation,
    ),
    isCheckedIn: IsCheckedInUseCase(repository),
    getMyAttendance: GetMyAttendanceUseCase(repository: repository),
    getEmployeeAttendance: GetEmployeeAttendanceUseCase(repository: repository),
  );
});
