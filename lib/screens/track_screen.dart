import 'dart:async';

import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';

// import 'package:permission_handler/permission_handler.dart';

import 'notifications_screen.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // PermissionStatus _permissionGranted = PermissionStatus.restricted;

  static const LatLng _center = LatLng(45.521563, -122.677433);

  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    super.initState();
  }

  // enableLocationPermissions() async {
  //   if (await Permission.locationWhenInUse.request().isGranted) {
  //     _permissionGranted = PermissionStatus.granted;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LineIcons.wallet),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(LineIcons.bell),
            color: Colors.white,
          ),
          if (userController.isLoggedIn.value == true)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const UserProfileScreen(title: 'User Profile'),
                  ),
                );
              },
              icon: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                  radius: 12.0),
              color: Colors.white,
            )
        ],
        elevation: 2.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepOrange,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
