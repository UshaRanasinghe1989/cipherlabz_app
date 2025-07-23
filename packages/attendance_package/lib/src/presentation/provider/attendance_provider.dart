import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
//ATTENDANCE PACKAGE
import 'package:attendance_package/attendance_package.dart';
//RESOURCES
import 'package:core/core.dart';

class AttendanceProvider extends ChangeNotifier {
  final AttendanceLocalDataSource dataSource;
  final AttendanceRepository repository;
  final AttendanceUseCases attendanceUseCases;

  bool _isCheckedIn = false;
  bool get isCheckedIn => _isCheckedIn;
  List<AttendanceEntity> attendanceList = [];
  Failure? failure;

  AttendanceProvider(this.repository, this.dataSource, this.attendanceUseCases);

  factory AttendanceProvider.empty() => AttendanceProvider(
    AttendanceRepositoryImpl.repo(),
    AttendanceLocalDataSource(),
    AttendanceUseCases(
      saveAttendance: SaveAttendanceUseCase(
        AttendanceRepositoryImpl.repo(),
        LocalAuth(),
        GetCurrentLoaction(),
      ),
      getAttendanceObj: GetAttendanceUseCase(
        repository: AttendanceRepositoryImpl.repo(),
      ),
      isCheckedIn: IsCheckedInUseCase(AttendanceRepositoryImpl.repo()),
      getMyAttendance: GetMyAttendanceUseCase(
        repository: AttendanceRepositoryImpl.repo(),
      ),
    ),
  );

  //SAVE ATTENDANCE
  Future<Either<Failure, AttendanceEntity>> saveAttendance(
    int userId,
    DateTime checkInTime,
  ) async {
    notifyListeners();
    try {
      return await attendanceUseCases.saveAttendance.call(userId, checkInTime);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: "$e"));
    }
  }

  //IS CHECKED IN FOR THE DAY
  Future<bool> isCheckedInProvider(int userId) async {
    _isCheckedIn = await IsCheckedInUseCase(repository).call(userId);
    notifyListeners();
    return _isCheckedIn;
  }

  //GET ATTENDANCE ENTITY OBJECT
  Future<Either<Failure, AttendanceEntity>> getAttendanceObj(int userId) async {
    //return await getAttendanceObj(userId).call(userId);
    final result = await attendanceUseCases.getAttendanceObj(
      userId,
      DateTime.now(),
    );
    notifyListeners();
    return result.fold(
      (failure) {
        // Handle failure
        return Left(GeneralFailure(errorMessage: "An Error Occured !"));
      },
      (entity) {
        print("$entity ***");
        // Success case: return the entity wrapped in Right
        return Right(entity);
      },
    );
  }

  //GET MY ATTENDANCE LIST
  Future<void> getMyAttendanceList(int myUserId, int numberOfDays) async {
    final result = await attendanceUseCases.getMyAttendance.call(
      myUserId,
      numberOfDays,
    );
    notifyListeners();
    return result.fold(
      (failure) {
        // Handle failure
        failure = GeneralFailure(errorMessage: "An Error Occured !");
      },
      (entityList) {
        attendanceList = entityList;
      },
    );
  }

  //   bool isCheckedIn = false;
  //   Map<int, AttendanceEntity> attendanceMap = AttendanceData.attendanceMap;

  //   //RETURN OBJECT FOR A USER ID
  //   AttendanceEntity? getAttendanceObj(int userId) {
  //     return AttendanceData.attendanceMap[userId];
  //   }

  //   //NEW SAVE ATTENDANCE RECORD

  //   //ADD ATTENDANCE RECORD
  //   void addAttendance(int userId, DateTime now) async {
  //     LocationData? position;

  //     try {
  //       await LocalAuth().canAuthWithBioFunc().then((result) async {
  //         if (result) {
  //           print("User authenticated");

  //           await GetCurrentLoaction().getCurrentLocation().then((
  //             currentLocation,
  //           ) {
  //             if (currentLocation == null) {
  //               print("Could not fetch location.");
  //               return;
  //             } else {
  //               position = currentLocation;
  //             }
  //           });

  //           if (!attendanceMap.values.any(
  //                 (attendance) => attendance.userId == userId,
  //               ) &&
  //               attendanceMap.values.any(
  //                 (attendance) => attendance.checkIn == DateTime.now(),
  //               )) {
  //             AttendanceStatus updatedStatus = setStatus(now);
  //             final newKey =
  //                 (attendanceMap.isNotEmpty ? attendanceMap.keys.last : 0) + 1;

  //             attendanceMap.putIfAbsent(
  //               newKey,
  //               () => AttendanceEntity(
  //                 id: newKey,
  //                 userId: userId,
  //                 checkIn: now,
  //                 checkOut: now,
  //                 latitude: position!.latitude!,
  //                 longitude: position!.longitude!,
  //                 status: updatedStatus,
  //               ),
  //             );

  //             updateCheckedInStatus(userId, now);

  //             print("${attendanceMap.keys} *******");
  //           } else {
  //             print("User available");
  //           }
  //         }
  //       });
  //     } catch (e) {
  //       print(e);
  //     }

  //     notifyListeners();
  //   }

  //   //UPDATE IS CHECKED IN
  //   void updateCheckedInStatus(int userId, DateTime checkIn) {
  //     isCheckedIn = attendanceMap.values.any(
  //       (attendance) => attendance.userId == userId,
  //     );

  //     notifyListeners();
  //   }

  //   //UPDATE CHECK IN STATUS
  //   AttendanceStatus setStatus(DateTime checkInTime) {
  //     final cutoff = DateTime(
  //       checkInTime.year,
  //       checkInTime.month,
  //       checkInTime.day,
  //       9,
  //       0,
  //     );

  //     if (checkInTime.isAfter(cutoff)) {
  //       return AttendanceStatus.late;
  //     } else {
  //       return AttendanceStatus.ontime;
  //     }
  //   }
}
// import 'package:local_auth/local_auth.dart';

// class LocalAuth {
//   final LocalAuthentication _auth = LocalAuthentication();
//   bool _isAuthenticated = false;

//   Future<bool> canAuthWithBioFunc() async {
//     try {
//       // Check if biometrics are available
//       final bool canAuthenticate = await _auth.canCheckBiometrics;
//       final bool isDeviceSupported = await _auth.isDeviceSupported();

//       if (!_isAuthenticated && canAuthenticate && isDeviceSupported) {
//         _isAuthenticated = await _auth.authenticate(
//           localizedReason: 'Please authenticate to proceed',
//           options: const AuthenticationOptions(
//             biometricOnly: true,
//             stickyAuth: true,
//             useErrorDialogs: true,
//           ),
//         );
//       }

//       return _isAuthenticated;
//     } catch (e) {
//       print('Authentication error: $e');
//       return false;
//     }
//   }
// }
