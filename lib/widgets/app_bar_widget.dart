import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/login_screen.dart';
import 'package:checkpoint_app2/screens/notifications_screen.dart';
import 'package:checkpoint_app2/screens/registration_tickets_screen.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../checkpoint_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String title;
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
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
          // color: Colors.white,
        ),
        Obx(() {
          if (userController.isLoggedIn.value == true) {
            return IconButton(
              tooltip: 'Registration Tickets',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationTicketsScreen(),
                  ),
                );
              },
              icon: const Icon(LineIcons.alternateListAlt),
              color: Colors.white,
            );
          } else {
            return const Visibility(
              child: Text('None'),
              visible: false,
            );
          }
        }),
        Obx(() {
          if (userController.isLoggedIn.value == true) {
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
            return IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              icon: const Icon(LineIcons.userCircle),
              color: Colors.white,
            );
          }
        })
      ],
    );
  }
}
