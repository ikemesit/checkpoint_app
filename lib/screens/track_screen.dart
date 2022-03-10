import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:checkpoint_app2/widgets/static_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spring/spring.dart';

import 'live_tracking_screen.dart';
import 'login_screen.dart';
import 'notifications_screen.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find<UserController>();
    final SpringController springController = SpringController();
    var activityChoices = <int, String>{
      0: 'WALKING',
      1: 'RUNNING',
      2: 'CYCLING'
    };

    if (_userController.trackScreenLoaded.value == false) {
      _userController.trackScreenLoaded.toggle();
    }

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   showModalBottomSheet(
    //       isDismissible: false,
    //       context: context,
    //       builder: (BuildContext context) {
    //         return Container(
    //             width: Get.width,
    //             height: 300,
    //             padding: const EdgeInsets.all(20.0),
    //             decoration: const BoxDecoration(
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: Colors.black26,
    //                       blurRadius: 5.0,
    //                       offset: Offset.zero)
    //                 ],
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(16.0),
    //                     topRight: Radius.circular(16.0))),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   children: [
    //                     Text(
    //                       'Select an activity and start tracking',
    //                       style: CheckpointTheme.lightTextTheme.headline4,
    //                     ),
    //                     const SizedBox(
    //                       height: 10.0,
    //                     ),
    //                     const Divider(),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Center(
    //                       child: Container(
    //                         decoration: ShapeDecoration(
    //                           color: controller.activityChoice.value == 0
    //                               ? Colors.orange
    //                               : Colors.black26,
    //                           shape: const CircleBorder(),
    //                         ),
    //                         child: IconButton(
    //                           icon: const Icon(LineIcons.walking),
    //                           onPressed: () {
    //                             controller.activityChoice(0);
    //                           },
    //                           iconSize: 52.0,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                     Center(
    //                       child: Container(
    //                         decoration: ShapeDecoration(
    //                           color: controller.activityChoice.value == 1
    //                               ? Colors.orange
    //                               : Colors.black26,
    //                           shape: const CircleBorder(),
    //                         ),
    //                         child: IconButton(
    //                           icon: const Icon(LineIcons.running),
    //                           onPressed: () {
    //                             controller.activityChoice(1);
    //                           },
    //                           iconSize: 52.0,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                     Center(
    //                       child: Container(
    //                         decoration: ShapeDecoration(
    //                           color: controller.activityChoice.value == 2
    //                               ? Colors.orange
    //                               : Colors.black26,
    //                           shape: const CircleBorder(),
    //                         ),
    //                         child: IconButton(
    //                           icon: const Icon(LineIcons.bicycle),
    //                           onPressed: () {
    //                             controller.activityChoice(2);
    //                           },
    //                           iconSize: 52.0,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: () {
    //                     Get.to(() => LiveTrackingScreen(),
    //                         transition: Transition.rightToLeft);
    //                   },
    //                   child: Text(
    //                     'Start Tracking',
    //                     style: CheckpointTheme.darkTextTheme.headline5,
    //                   ),
    //                 ),
    //               ],
    //             ));
    //       });
    // });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Track',
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
        body: Stack(
          children: [
            const StaticMapWidget(),
            Opacity(
              opacity: 0.4,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
            Obx(() {
              if (_userController.isLoggedIn.value == false) {
                return Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        padding: const EdgeInsets.all(30.0),
                        height: 500.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2.0,
                                  offset: Offset.zero)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'You need to be logged in to start tracking',
                              style: CheckpointTheme.lightTextTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () => Get.to(() => LoginScreen(),
                                  fullscreenDialog: true),
                              child: Text(
                                'Login to start tracking',
                                style: CheckpointTheme.darkTextTheme.bodyText1,
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              } else {
                return const Visibility(visible: false, child: Spacer());
              }
            }),
            Obx(() {
              if (_userController.isLoggedIn.value == true) {
                return Positioned(
                  left: 0,
                  bottom: 0,
                  child: _userController.trackScreenLoaded.value == false
                      ? Spring.slide(
                          springController: springController,
                          slideType: SlideType.slide_in_bottom,
                          animDuration: const Duration(milliseconds: 450),
                          child: Container(
                              width: Get.width,
                              height: 300,
                              padding: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5.0,
                                        offset: Offset.zero)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Select an activity and start tracking',
                                        style: CheckpointTheme
                                            .lightTextTheme.headline4,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    0
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.walking),
                                            onPressed: () {
                                              _userController.activityChoice(0);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    1
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.running),
                                            onPressed: () {
                                              _userController.activityChoice(1);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    2
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.bicycle),
                                            onPressed: () {
                                              _userController.activityChoice(2);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => LiveTrackingScreen(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Text(
                                      'Start Tracking',
                                      style: CheckpointTheme
                                          .darkTextTheme.headline5,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      : Container(
                          width: Get.width,
                          height: 300,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset.zero)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Select an activity and start tracking',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline4,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Divider(),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    0
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.walking),
                                            onPressed: () {
                                              _userController.activityChoice(0);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        'Walking',
                                        style: CheckpointTheme
                                            .lightTextTheme.headline5,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    1
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.running),
                                            onPressed: () {
                                              _userController.activityChoice(1);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        'Running',
                                        style: CheckpointTheme
                                            .lightTextTheme.headline5,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: _userController
                                                        .activityChoice.value ==
                                                    2
                                                ? Colors.orange
                                                : Colors.black26,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(LineIcons.bicycle),
                                            onPressed: () {
                                              _userController.activityChoice(2);
                                            },
                                            iconSize: 52.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        'Cycling',
                                        style: CheckpointTheme
                                            .lightTextTheme.headline5,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40.0),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => LiveTrackingScreen(),
                                      transition: Transition.rightToLeft);
                                },
                                child: Text(
                                  'Start Tracking',
                                  style:
                                      CheckpointTheme.darkTextTheme.headline5,
                                ),
                              ),
                            ],
                          )),
                );
              } else {
                return const Visibility(visible: false, child: Spacer());
              }
            })
          ],
        ));
  }
}
