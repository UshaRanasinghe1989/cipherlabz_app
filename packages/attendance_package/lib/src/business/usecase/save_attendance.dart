import 'package:dartz/dartz.dart';
//BUSINESS
import 'package:attendance_package/src/business/entity/attendance_entity.dart';
import 'package:attendance_package/src/business/repository/attendance_repository.dart';
//DATA
import 'package:attendance_package/src/data/dummy_data/dummy_data.dart';
//ENAUM
import 'package:attendance_package/src/enum/attendance_status.dart';
//RESOURCES
import 'package:core/core.dart';
//HELPERS
import 'package:core/helpers/get_location.dart';

class SaveAttendanceUseCase {
  final AttendanceRepository repository;
  final LocalAuth localAuth;
  final GetCurrentLoaction loaction;

  SaveAttendanceUseCase(this.repository, this.localAuth, this.loaction);

  Future<Either<Failure, AttendanceEntity>> call(
    int userId,
    DateTime checkInTime,
  ) async {
    try {
      //LOCAL AUTHENTICATION
      // final canAuthenticate = await localAuth.canAuthWithBioFunc();
      // if (!canAuthenticate)
      //   return Left(AuthFailure(errorMessage: 'Local Authentication Failed !'));
      //GET CURRENT LOCATION
      final currentLocation = await loaction.getCurrentLocation();
      if (currentLocation == null)
        return Left(LocationFailure(errorMessage: 'Location Failed !'));

      final attendanceMap = AttendanceData.attendanceMap;
      final now = DateTime.now();
      //IS ALREADY CHECKED IN
      final alreadyCheckedInToday = AttendanceHelper.isCheckedIn(userId);
      //FALSE
      if (!alreadyCheckedInToday) {
        //GENERATE ATTENDANCE RECORD ID
        final newId = attendanceMap.isNotEmpty
            ? attendanceMap.keys.last + 1
            : 1;
        //ATEENDANCE ENTITY OBJECT
        final entity = AttendanceEntity(
          id: newId,
          userId: userId,
          checkIn: checkInTime,
          checkOut: checkInTime,
          latitude: currentLocation.latitude!,
          longitude: currentLocation.longitude!,
          status: setStatus(now),
        );
        //CALL REPOSITORY METHOD
        return await repository.saveAttendance(entity);
      } else {
        //TRUE - ALREADY CHECKED IN
        return Left(
          DuplicateAttendanceFailure(
            errorMessage: 'Already Checked-In for the Day !',
          ),
        );
      }
    } catch (e) {
      return Left(GeneralFailure(errorMessage: 'An Error Occured !'));
    }
  }

  //IS SAME DAY
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  //UPDATE CHECK IN STATUS
  AttendanceStatus setStatus(DateTime checkInTime) {
    final cutoff = DateTime(
      checkInTime.year,
      checkInTime.month,
      checkInTime.day,
      9,
      0,
    );

    if (checkInTime.isAfter(cutoff)) {
      return AttendanceStatus.late;
    } else {
      return AttendanceStatus.ontime;
    }
  }
}
