import 'package:attendance_package/attendance_package.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
//RESOURCES
import 'package:color_package/color_package.dart';
//HELPERS
import 'package:core/helpers/get_location.dart';
//WIDGETS
import 'package:attendance_package/src/presentation/widget/check_in_widget.dart';
import 'package:login_package/login_package.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LocationData? _currentLocation;
  GoogleMapController? mapController;
  //LatLng currentLocation = const LatLng(6.7174624, 79.9066958);
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;

  //Set<Marker> markersSet = {};

  // final LatLng _center = const LatLng(
  //   6.9271,
  //   79.8612,
  // ); // Example: Colombo, Sri Lanka

  @override
  void initState() {
    _getLocation();
    //getCustomMarker();
    super.initState();
    //_loadUserLocation(); // 🔁 async method
  }

  // void getCustomMarker() {
  //       BitmapDescriptor.asset(
  //     const ImageConfiguration(),
  //     "assets/images/profile_image.png",
  //   ).then((icon) {
  //     setState(() {
  //       _currentLocation = location;
  //       customMarker = icon;
  //     });
  //   });
  // }

  Future<void> _getLocation() async {
    try {
      final location = await GetCurrentLoaction().getCurrentLocation();

      BitmapDescriptor.asset(
        const ImageConfiguration(),
        "packages/attendance_package/assets/profile_image.png",
      ).then((icon) {
        if (location != null) {
          setState(() {
            _currentLocation = location;
            customMarker = icon;
          });
        }
      });
    } catch (e) {
      print(e);
    }
    // if (location != null) {
    //   setState(() {
    //     _currentLocation = location;
    //   });
    // }
  }

  // Future<void> _loadUserLocation() async {
  //   final location = await GetUserLocationUseCase(LocationService()).execute();
  //   if (location != null) {
  //     setState(() {
  //       _currentLocation = location;
  //     });
  //   }
  // }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final LatLng userLatLng = LatLng(
      _currentLocation!.latitude!,
      _currentLocation!.longitude!,
    );
    context.read<AttendanceProvider>().isCheckedInProvider(user!.id);
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black00000040), //#00000040
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.black00000040, // shadow color
                spreadRadius: 1, // how far the shadow spreads
                blurRadius: 8, // how blurry the shadow is
                offset: Offset(0, 2), // shadow position (x, y)
              ),
              BoxShadow(
                color: AppColors.white, // shadow color
                spreadRadius: 1, // how far the shadow spreads
                blurRadius: 8, // how blurry the shadow is
                offset: Offset(0, 2), // shadow position (x, y)
              ),
            ],
          ),

          child: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              color: AppColors.whiteFFFFFFD4,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black00000040, // shadow color #00000040
                  spreadRadius: 2, // how far the shadow spreads
                  blurRadius: 6, // how blurry the shadow is
                  offset: Offset(0, 4), // shadow position (x, y)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: userLatLng,
                  zoom: 17.0,
                ),
                markers: {
                  Marker(
                    position: userLatLng,
                    markerId: MarkerId('my_marker_id'),
                    icon: customMarker,
                  ),
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ),
        ),
        CheckInWidget(),
      ],
    );
  }
}
