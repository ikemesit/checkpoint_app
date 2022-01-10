import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'notifications_screen.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activity',
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
    );
  }
}
