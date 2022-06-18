import 'dart:async';

import 'package:checkpoint_app2/controllers/activity_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:latlong2/latlong.dart' as lt;
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:sensors_plus/sensors_plus.dart';

const double cameraZoom = 14.0;
const double cameraTilt = 0;
const double cameraBearing = 30;
const LatLng sourceLocation = LatLng(42.747932, -71.167889);
const LatLng destLocation = LatLng(37.335685, -122.0605916);

class LiveMapWidget extends StatefulWidget {
  final LocationData? initialLocation;

  const LiveMapWidget({Key? key, required this.initialLocation})
      : super(key: key);

  @override
  State<LiveMapWidget> createState() => _LiveMapWidgetState();
}

class _LiveMapWidgetState extends State<LiveMapWidget> {
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
  late StreamSubscription locationStream;
  final UserController userController = Get.find<UserController>();
  final ActivityController _mapWidgetController = Get.put(ActivityController());
  late LocationData previousPoint;
  double distance = 0.0;
  late String timeEnded;
  late StreamSubscription<UserAccelerometerEvent> _userAccelerometerEventStream;
  double zAxisAcceleration = 0.0;
  final lt.Distance latLngDistance = const lt.Distance();

  @override
  void initState() {
    location = Location();
    polylinePoints = PolylinePoints();

    setInitialLocation();
    setSourceAndDestinationIcons();
    initLocationStreaming();
    initUserAccelerometerStream();

    _mapWidgetController.timeTrackingStarted(Jiffy().jms);

    super.initState();
  }

  @override
  void dispose() {
    stopLocationStreaming();
    stopUserAccelerometerStream();
    super.dispose();
  }

  void initLocationStreaming() {
    locationStream = location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();
      setPolylines();

      _mapWidgetController.latitude(currentLocation?.latitude.toString());
      _mapWidgetController.longitude(currentLocation?.longitude.toString());
      _mapWidgetController.altitude(currentLocation?.altitude);

      calculateDistanceTravelled(previousPoint, cLoc);

      _mapWidgetController.distance(distance);
    });
  }

  void stopLocationStreaming() {
    locationStream.cancel();
    _mapWidgetController.timeTrackingEnded(Jiffy().yMMMdjm);
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/destination_map_marker.png');
  }

  void setInitialLocation() {
    currentLocation = widget.initialLocation; //await location.getLocation();
    destinationLocation = LocationData.fromMap({
      "latitude": destLocation.latitude,
      "longitude": destLocation.longitude
    });
    previousPoint = currentLocation!;
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

  void initUserAccelerometerStream() {
    _userAccelerometerEventStream =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      zAxisAcceleration = event.z;
      // print(zAxisAcceleration);
    });
  }

  void stopUserAccelerometerStream() async {
    await _userAccelerometerEventStream.cancel();
  }

  void calculateDistanceTravelled(
    LocationData prevPoint,
    LocationData currPoint,
  ) {
    var from =
        mp.LatLng(prevPoint.latitude as double, prevPoint.longitude as double);
    var to =
        mp.LatLng(currPoint.latitude as double, currPoint.longitude as double);

    if (zAxisAcceleration < -0.5) {
      print(latLngDistance.as(
          lt.LengthUnit.Meter,
          lt.LatLng(
              prevPoint.latitude as double, prevPoint.longitude as double),
          lt.LatLng(
              currPoint.latitude as double, currPoint.longitude as double)));

      distance += latLngDistance.as(
          lt.LengthUnit.Meter,
          lt.LatLng(
              prevPoint.latitude as double, prevPoint.longitude as double),
          lt.LatLng(
              currPoint.latitude as double,
              currPoint.longitude
                  as double)); //mp.SphericalUtil.computeDistanceBetween(from, to) / 10;
    }

    _mapWidgetController.distance(distance);
    previousPoint = prevPoint;
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
