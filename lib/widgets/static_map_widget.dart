import 'dart:async';

import 'package:checkpoint_app2/controllers/activity_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const double cameraZoom = 14.0;
const double cameraTilt = 0;
const double cameraBearing = 30;
const LatLng sourceLocation = LatLng(42.747932, -71.167889);
const LatLng destLocation = LatLng(37.335685, -122.0605916);

class StaticMapWidget extends StatefulWidget {
  const StaticMapWidget({Key? key}) : super(key: key);

  @override
  _StaticMapWidgetState createState() => _StaticMapWidgetState();
}

class _StaticMapWidgetState extends State<StaticMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  String googleAPIKey = dotenv.get('GOOGLE_MAP_API_KEY', fallback: null);
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;
  final UserController userController = Get.find<UserController>();
  final ActivityController _mapWidgetController = Get.put(ActivityController());

  @override
  void initState() {
    location = Location();
    polylinePoints = PolylinePoints();

    setInitialLocation();
    setSourceAndDestinationIcons();

    // location.onLocationChanged.listen((LocationData cLoc) {
    //   currentLocation = cLoc;
    //   updatePinOnMap();
    //
    //   _mapWidgetController.latitude(currentLocation?.latitude.toString());
    //   _mapWidgetController.longitude(currentLocation?.longitude.toString());
    //   _mapWidgetController.altitude(currentLocation?.altitude.toString());
    // });

    super.initState();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/destination_map_marker.png');
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
    destinationLocation = LocationData.fromMap({
      "latitude": destLocation.latitude,
      "longitude": destLocation.longitude
    });

    updatePinOnMap();
  }

  void showPinsOnMap() {
    var pinPosition = LatLng(currentLocation?.latitude as double,
        currentLocation?.longitude as double);
    var destPosition = LatLng(destinationLocation.latitude as double,
        destinationLocation.longitude as double);

    _markers.add(Marker(
        markerId: const MarkerId('sourcePin'),
        position: pinPosition,
        icon: sourceIcon));

    _markers.add(Marker(
        markerId: const MarkerId('destPin'),
        position: destPosition,
        icon: destinationIcon));

    setPolylines();
  }

  void setPolylines() async {
    PolylineResult result = (await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(currentLocation?.latitude as double,
          currentLocation?.longitude as double),
      PointLatLng(destinationLocation.latitude as double,
          destinationLocation.longitude as double),
    ));

    for (var point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
    setState(() {
      _polylines.add(Polyline(
          width: 5,
          polylineId: const PolylineId("poly"),
          color: const Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates));
    });
  }

  void updatePinOnMap() async {
    CameraPosition cPosition = CameraPosition(
      zoom: cameraZoom,
      tilt: cameraTilt,
      bearing: cameraBearing,
      target: LatLng(currentLocation?.latitude as double,
          currentLocation?.longitude as double),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));

    setState(() {
      var pinPosition = LatLng(currentLocation?.latitude as double,
          currentLocation?.longitude as double);

      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: const MarkerId('sourcePin'),
          position: pinPosition,
          icon: sourceIcon));
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: cameraZoom,
        tilt: cameraTilt,
        bearing: cameraBearing,
        target: sourceLocation);

    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation?.latitude as double,
              currentLocation?.longitude as double),
          zoom: cameraZoom,
          tilt: cameraTilt,
          bearing: cameraBearing);
    }

    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      compassEnabled: true,
      zoomControlsEnabled: false,
      tiltGesturesEnabled: false,
      markers: _markers,
      polylines: _polylines,
      initialCameraPosition: initialCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        showPinsOnMap();
      },
    );
  }
}
