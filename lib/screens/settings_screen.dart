import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'notifications_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f3f8),
      appBar: AppBar(
        title: const Text(
          'Settings',
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
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         const FaIcon(FontAwesomeIcons.usersCog),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           'Update Profile',
          //           style: CheckpointTheme.lightTextTheme.bodyText2,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const Divider(),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: const [
          //             FaIcon(FontAwesomeIcons.usersCog),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Text(
          //               'Profile Settings',
          //               style: TextStyle(color: Colors.black87),
          //             )
          //           ],
          //         ),
          //         const FaIcon(FontAwesomeIcons.chevronRight),
          //       ],
          //     ),
          //   ),
          // ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(LineIcons.newspaper),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Subscriptions',
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  ),
                  const Icon(LineIcons.angleRight),
                ],
              ),
            ),
          ),
          const Divider(),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: const [
          //         FaIcon(FontAwesomeIcons.usersCog),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           'Profile Settings',
          //           style: TextStyle(color: Colors.black87),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      // bottomNavigationBar: const GlobalBottomNavigation(),
      // drawer: const NavigationDrawer(),
    );
  }
}
