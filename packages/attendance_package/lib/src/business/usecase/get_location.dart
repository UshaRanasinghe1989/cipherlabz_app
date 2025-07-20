import 'package:core/core.dart';
import 'package:location/location.dart';

class GetLocation {
  Location location = Location();
  Future<LocationData> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
      }
    } catch (e) {
      LocationPermissionFailure(
        errorMessage: "Please enable location service !",
      );
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        LocationPermissionFailure(
          errorMessage: "Please enable location service !",
        );
      }
    }

    return await location.getLocation();
  }
}
