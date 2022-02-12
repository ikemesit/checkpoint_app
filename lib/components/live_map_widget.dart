import 'dart:async';

import 'package:checkpoint_app2/controllers/map_widget_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;

const double cameraZoom = 18;
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
  final MapWidgetController _mapWidgetController =
      Get.put(MapWidgetController());
  late LocationData previousPoint;
  double distance = 0.0;
  late String timeEnded;

  @override
  void initState() {
    location = Location();
    polylinePoints = PolylinePoints();

    setInitialLocation();
    setSourceAndDestinationIcons();

    locationStream = location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();

      _mapWidgetController.latitude(currentLocation?.latitude.toString());
      _mapWidgetController.longitude(currentLocation?.longitude.toString());
      _mapWidgetController.altitude(currentLocation?.altitude);

      calculateDistanceTravelled(previousPoint, cLoc);

      _mapWidgetController.distance(distance);
    });

    _mapWidgetController.timeTrackingStarted(Jiffy().yMMMdjm);

    super.initState();
  }

  @override
  void dispose() {
    locationStream.cancel();
    _mapWidgetController.timeTrackingEnded(Jiffy().yMMMdjm);
    super.dispose();
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

  void calculateDistanceTravelled(
      LocationData prevPoint, LocationData currPoint) {
    var from =
        mp.LatLng(prevPoint.latitude as double, prevPoint.longitude as double);
    var to =
        mp.LatLng(currPoint.latitude as double, currPoint.longitude as double);
    distance += mp.SphericalUtil.computeDistanceBetween(from, to) / 10;
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
