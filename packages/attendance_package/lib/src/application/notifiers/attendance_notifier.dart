// attendance_notifier.dart
import 'package:attendance_package/attendance_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:user_package/user_package.dart';

class AttendanceNotifier extends Notifier<AttendanceState> {
  late final AttendanceUseCases _attendanceUseCases = ref.read(
    attendanceUseCasesProvider,
  );

  @override
  AttendanceState build() {
    return AttendanceState();
  }

  //SAVE ATTENDANCE
  Future<void> saveAttendance(int userId, DateTime checkInTime) async {
    state = state.copyWith(isLoading: true);
    final Either<Failure, AttendanceEntity> result = await _attendanceUseCases
        .saveAttendance
        .call(userId, checkInTime);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        lastSaved: null,
      ),
      (saved) => state = state.copyWith(
        isLoading: false,
        failure: null,
        lastSaved: saved,
      ),
    );
  }

  //FETCH ATTENDANCE ON USER ID AND TIME
  Future<void> fetchAttendance(int userId, DateTime date) async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, AttendanceEntity> result = await _attendanceUseCases
        .getAttendanceObj
        .call(userId, date);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        attendance: null,
      ),
      (attendance) => state = state.copyWith(
        isLoading: false,
        failure: null,
        attendance: attendance,
      ),
    );
  }

  //GET MY ATTENDANCE LIST
  Future<void> getMyAttendanceList(int myUserId, int numberOfDays) async {
    state = state.copyWith(isLoading: true);

    final result = await _attendanceUseCases.getMyAttendance.call(
      myUserId,
      numberOfDays,
    );
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        failure: failure,
        myAttendanceList: null,
      ),
      (list) => state = state.copyWith(
        isLoading: false,
        failure: null,
        myAttendanceList: list,
      ),
    );
  }

  //GET EMPLOYEE ATTENDANCE LIST
  Future<void> getEmployeeAttendanceList(int superiorId) async {
    final result;
    state = state.copyWith(isLoading: true);
    //GET SUBORDINATE ID LIST
    await ref.read(userProvider.notifier).getSubordinateList(superiorId);
    final List<int>? list = await ref.watch(userProvider).subordinateList;

    //CALL USECASE METHOS
    if (list != null && list.isNotEmpty) {
      result = await _attendanceUseCases.getEmployeeAttendance.call(list);

      result.fold(
        (failure) => state = state.copyWith(
          isLoading: false,
          failure: failure,
          employeeAttendanceList: null,
        ),
        (list) => state = state.copyWith(
          isLoading: false,
          failure: null,
          employeeAttendanceList: list,
        ),
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        failure: GeneralFailure(errorMessage: 'No subordinates found'),
      );
    }
  }

  // //IS CHECKED IN FOR THE DAY
  // Future<bool> isCheckedInProvider(int userId) async {
  //   _isCheckedIn = await IsCheckedInUseCase(repository).call(userId);
  //   notifyListeners();
  //   return _isCheckedIn;
  //}
}
