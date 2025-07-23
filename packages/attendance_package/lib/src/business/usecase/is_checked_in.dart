import 'package:attendance_package/src/business/repository/attendance_repository.dart';

class IsCheckedInUseCase {
  final AttendanceRepository repository;

  IsCheckedInUseCase(this.repository);

  Future<bool> call(int userId) async {
    return repository.isCheckedIn(userId);
  }
}
