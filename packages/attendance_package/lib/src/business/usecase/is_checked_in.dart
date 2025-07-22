import 'package:attendance_package/src/business/repository/attendance_repository.dart';

class isCheckedInUseCase {
  final AttendanceRepository repository;

  isCheckedInUseCase(this.repository);

  Future<bool> call(int userId) async {
    return repository.isCheckedIn(userId);
  }
}
