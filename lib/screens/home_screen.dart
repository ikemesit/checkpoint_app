import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/authentication_controller.dart';
import 'package:checkpoint_app2/controllers/navigation_controller.dart';
import 'package:checkpoint_app2/screens/activity_screen.dart';
import 'package:checkpoint_app2/screens/events_screen.dart';
import 'package:checkpoint_app2/screens/leaderboard_screen.dart';
import 'package:checkpoint_app2/screens/track_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  void initState() {
    requestNotificationPermission();
    super.initState();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => print('Token: $value'));

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('Message data: ${message.data}');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text('${message.data}'),
            backgroundColor: Theme.of(context).splashColor),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(NavigationController());
    final AuthenticationController _authenticationController =
        Get.put(AuthenticationController());

    return GetBuilder<NavigationController>(
      builder: (pageController) {
        return Scaffold(
          body: IndexedStack(
            index: pageController.tabIndex,
            children: [
              const EventsScreen(),
              const TrackScreen(),
              ActivityScreen(),
              LeaderboardScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 22.0,
            selectedItemColor: CheckpointTheme.light()
                .bottomNavigationBarTheme
                .selectedItemColor,
            unselectedItemColor: Colors.black45,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            currentIndex: pageController.tabIndex,
            onTap: pageController.changeTabIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.calendarWithDayFocus), label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.mapMarker), label: 'Track'),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.areaChart), label: 'Activity'),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.cog), label: 'Leaderboard'),
            ],
          ),
        );
      },
    );
  }
}
