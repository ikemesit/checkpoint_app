import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/enums/activityChoices.dart';
import 'package:checkpoint_app2/screens/live_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../checkpoint_theme.dart';

class ActivityStartWidget extends StatelessWidget {
  const ActivityStartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find<UserController>();
    var activityChoices = <int, String>{
      0: 'WALKING',
      1: 'RUNNING',
      2: 'CYCLING'
    };
    return Container(
        width: Get.width,
        height: 300,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5.0, offset: Offset.zero)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Select an activity and start tracking',
                    style: CheckpointTheme.lightTextTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: ShapeDecoration(
                            color: _userController.activityChoice.value ==
                                    ActivityChoices.walking
                                ? Colors.orange
                                : Colors.black26,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(LineIcons.walking),
                            onPressed: () {
                              _userController
                                  .activityChoice(ActivityChoices.walking);
                            },
                            iconSize: 52.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Walking',
                        style: CheckpointTheme.lightTextTheme.headline5,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: ShapeDecoration(
                            color: _userController.activityChoice.value ==
                                    ActivityChoices.running
                                ? Colors.orange
                                : Colors.black26,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(LineIcons.running),
                            onPressed: () {
                              _userController
                                  .activityChoice(ActivityChoices.running);
                            },
                            iconSize: 52.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Running',
                        style: CheckpointTheme.lightTextTheme.headline5,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: ShapeDecoration(
                            color: _userController.activityChoice.value ==
                                    ActivityChoices.cycling
                                ? Colors.orange
                                : Colors.black26,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(LineIcons.bicycle),
                            onPressed: () {
                              _userController
                                  .activityChoice(ActivityChoices.cycling);
                            },
                            iconSize: 52.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Cycling',
                        style: CheckpointTheme.lightTextTheme.headline5,
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
                  style: CheckpointTheme.darkTextTheme.headline5,
                ),
              ),
            ],
          );
        }));
  }
}
