import 'package:flutter/material.dart';
import 'package:location/location.dart';
//BUSINESS
import 'package:attendance_package/src/business/entity/attendance_entity.dart';
//DATA
import 'package:attendance_package/src/data/dummy_data/dummy_data.dart';
//ENUM
import 'package:attendance_package/src/enum/attendance_status.dart';
//HELPERS
import 'package:core/helpers/get_location.dart';
import 'package:core/helpers/local_auth.dart';

class AttendanceProvider extends ChangeNotifier {
  bool isCheckedIn = false;
  Map<int, AttendanceEntity> attendanceMap = AttendanceData.attendanceMap;

  //RETURN OBJECT FOR A USER ID
  AttendanceEntity? getAttendanceObj(int userId) {
    return AttendanceData.attendanceMap[userId];
  }

  //ADD ATTENDANCE RECORD
  void addAttendance(int userId, DateTime now) async {
    LocationData? position;

    try {
      await LocalAuth().canAuthWithBioFunc().then((result) async {
        if (result) {
          print("User authenticated");

          await GetCurrentLoaction().getCurrentLocation().then((
            currentLocation,
          ) {
            if (currentLocation == null) {
              print("Could not fetch location.");
              return;
            } else {
              position = currentLocation;
            }
          });

          if (!attendanceMap.values.any(
                (attendance) => attendance.userId == userId,
              ) &&
              attendanceMap.values.any(
                (attendance) => attendance.checkIn == DateTime.now(),
              )) {
            AttendanceStatus updatedStatus = setStatus(now);
            final newKey =
                (attendanceMap.isNotEmpty ? attendanceMap.keys.last : 0) + 1;

            attendanceMap.putIfAbsent(
              newKey,
              () => AttendanceEntity(
                id: newKey,
                userId: userId,
                checkIn: now,
                checkOut: now,
                latitude: position!.latitude!,
                longitude: position!.longitude!,
                status: updatedStatus,
              ),
            );

            updateCheckedInStatus(userId, now);

            print("${attendanceMap.keys} *******");
          } else {
            print("User available");
          }
        }
      });
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  //UPDATE IS CHECKED IN
  void updateCheckedInStatus(int userId, DateTime checkIn) {
    isCheckedIn = attendanceMap.values.any(
      (attendance) => attendance.userId == userId,
    );

    notifyListeners();
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
