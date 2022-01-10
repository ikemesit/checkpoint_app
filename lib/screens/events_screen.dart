import 'package:checkpoint_app2/controllers/event_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/notifications_screen.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:line_icons/line_icons.dart';

import '../components/components.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventController eventController = Get.put(EventController());
    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: const Color(0xfff2f3f8),
      appBar: AppBar(
        title: const Text(
          'Events',
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
      body: Obx(
        () {
          if (eventController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            itemCount: eventController.eventsList.length,
            itemBuilder: (BuildContext context, index) {
              return EventCard(
                event: eventController.eventsList[index],
              );
              // }
            },
          );
        },
      ),
    );
  }
}
