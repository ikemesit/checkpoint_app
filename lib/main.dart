import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/screens/home_screen.dart';
import 'package:checkpoint_app2/screens/notifications_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controllers/user_controller.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic('general');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const CheckpointApp());
}

class CheckpointApp extends StatefulWidget {
  const CheckpointApp({Key? key}) : super(key: key);

  @override
  State<CheckpointApp> createState() => _CheckpointAppState();
}

class _CheckpointAppState extends State<CheckpointApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void initializeControllers() {
    final UserController userController = Get.put(UserController());
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    // if (message.data['type'] == 'chat') {

    Get.to(() => NotificationsScreen());
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => NotificationsScreen(),
    //     ));
    // }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    initializeControllers();

    // if (_error) {
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'Checkpoint',
    //       theme: CheckpointTheme.light(),
    //       home: const Scaffold(
    //         body: Center(
    //           child: Text('An Error Occurred',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold, color: Colors.red)),
    //         ),
    //       ));
    // }
    //
    // if (!_initialized) {
    //   return GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Checkpoint',
    //     theme: CheckpointTheme.light(),
    //     home: const Scaffold(
    //       body: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     ),
    //   );
    // }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Checkpoint App',
        theme: CheckpointTheme.light(),
        home: const HomeScreen() //const LandingScreen(),
        );
  }
}
