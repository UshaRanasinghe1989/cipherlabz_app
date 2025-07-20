import 'package:local_auth/local_auth.dart';

class LocalAuth {
  final LocalAuthentication _auth = LocalAuthentication();
  bool isAuthenticated = false;

  Future<bool> canAuthWithBioFunc() async {
    try {
      // Check if biometrics are available
      final bool canAuthenticate = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (isAuthenticated && canAuthenticate && isDeviceSupported) {
        isAuthenticated = await _auth.authenticate(
          localizedReason: 'Please authenticate to proceed',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      }

      return isAuthenticated;
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }
}

// import 'package:local_auth/local_auth.dart';

// class LocalAuth {
//   bool _isAuthenticated = false;
//   final LocalAuthentication _auth = LocalAuthentication();

//   Future<bool> canAuthWithBioFunc() async {
//     try {
//       final bool canAuthWIthBio = await _auth.canCheckBiometrics;

//       if (!_isAuthenticated) {
//         if (canAuthWIthBio) {
//           _isAuthenticated = await _auth.authenticate(
//             localizedReason: "Please authenticate",
//           );
//         }
//       }
//       return _isAuthenticated;
//     } catch (e) {
//       return false;
//     }
//   }
// }
