import 'package:checkpoint_app2/components/live_map_widget.dart';
import 'package:checkpoint_app2/controllers/map_widget_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:location/location.dart';

import '../checkpoint_theme.dart';
import 'notifications_screen.dart';

class LiveTrackingScreen extends StatelessWidget {
  LiveTrackingScreen({Key? key}) : super(key: key);

  final Location location = Location();

  @override
  Widget build(BuildContext context) {
    UserController _userController = Get.find<UserController>();
    MapWidgetController _mapWidgetController = Get.find<MapWidgetController>();
    final Future<LocationData> currentLocation = location.getLocation();

    Icon getActivityIcon() {
      if (_userController.activityChoice.value == 0) {
        return const Icon(
          LineIcons.walking,
          size: 48.0,
          color: Colors.white,
        );
      } else if (_userController.activityChoice.value == 1) {
        return const Icon(
          LineIcons.running,
          size: 48.0,
          color: Colors.white,
        );
      } else {
        return const Icon(
          LineIcons.biking,
          size: 48.0,
          color: Colors.white,
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Live Activity Tracking',
            style: CheckpointTheme.darkTextTheme.headline4,
          ),
          actions: [
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
            Obx(() {
              if (_userController.isLoggedIn.value == true) {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserProfileScreen(title: 'User Profile'),
                      ),
                    );
                  },
                  icon: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                      radius: 12.0),
                  color: Colors.white,
                );
              } else {
                return const Visibility(
                  child: Spacer(),
                  visible: false,
                );
              }
            })
          ],
        ),
        body: FutureBuilder<LocationData>(
            future: currentLocation,
            builder:
                (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
              Stack mapScreen;
              if (snapshot.hasData) {
                mapScreen = Stack(
                  children: [
                    LiveMapWidget(initialLocation: snapshot.data),
                    Positioned(
                      left: 10.0,
                      bottom: 10.0,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 320.0,
                        width: Get.width - 20.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2.0,
                                  offset: Offset.zero)
                            ]),
                        child: Obx(
                          () => Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const ShapeDecoration(
                                      color: Colors.orange,
                                      shape: CircleBorder(),
                                    ),
                                    child: getActivityIcon(),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Time Started',
                                          style: CheckpointTheme
                                              .lightTextTheme.headline5),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                          _mapWidgetController
                                              .timeTrackingStarted.value,
                                          style: CheckpointTheme
                                              .lightTextTheme.bodyText2)
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Elevation',
                                          style: CheckpointTheme
                                              .lightTextTheme.headline5),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                          _mapWidgetController.altitude.value
                                              .toStringAsFixed(3),
                                          style: CheckpointTheme
                                              .lightTextTheme.bodyText2)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Latitude',
                                          style: CheckpointTheme
                                              .lightTextTheme.headline5),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(_mapWidgetController.latitude.value,
                                          style: CheckpointTheme
                                              .lightTextTheme.bodyText2)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Longitude:',
                                          style: CheckpointTheme
                                              .lightTextTheme.headline5),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(_mapWidgetController.longitude.value,
                                          style: CheckpointTheme
                                              .lightTextTheme.bodyText2)
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Distance:',
                                          style: CheckpointTheme
                                              .lightTextTheme.headline5),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                          _mapWidgetController.distance.value
                                                  .toStringAsFixed(3) +
                                              'm',
                                          style: CheckpointTheme
                                              .lightTextTheme.bodyText2)
                                    ],
                                  )
                                ],
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => const LoadingWidget(
                                      stateText: 'Saving Session',
                                    ),
                                  );

                                  await Future.delayed(
                                      const Duration(seconds: 2), () {
                                    Navigator.pop(context);
                                    Get.back(closeOverlays: true);
                                  });
                                },
                                child: Text(
                                  'Stop Tracking',
                                  style:
                                      CheckpointTheme.darkTextTheme.headline5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                mapScreen = Stack(
                  children: [
                    Center(
                      child: Text(
                        'An Error Occurred!',
                        style: CheckpointTheme.lightTextTheme.headline3,
                      ),
                    )
                  ],
                );
              } else {
                mapScreen = Stack(
                  children: const [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                );
              }

              return mapScreen;
            }));
  }
}
