import 'dart:core';

import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/authentication_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/events_screen.dart';
import 'package:checkpoint_app2/screens/profile_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'friends_family_screen.dart';
import 'home_screen.dart';

class UserProfileScreen extends StatelessWidget {
  final String title;

  UserProfileScreen({Key? key, required this.title}) : super(key: key);

  final UserController userController = Get.put(UserController());
  final AuthenticationController authController =
      Get.put(AuthenticationController());

  logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userController.userList.clear();
    userController.logout(userController.userList[0].cUserID as String);
    Get.offAll(const EventsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: CheckpointTheme.darkTextTheme.headline4,
        ),
        //
      ),
      body: Obx(() {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                    radius: 60.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    userController.userList[0].cName as String,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileDetailsScreen()),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.user),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Profile Details',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                              const Icon(LineIcons.angleRight)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => FriendsFamilyScreen(),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.users),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Friends & Family',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                              const Icon(LineIcons.angleRight)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // userController.userList.clear();
                      userController
                          .logout(userController.userList[0].cUserID as String);
                      Get.offAll(const HomeScreen());
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.lock),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Logout',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
