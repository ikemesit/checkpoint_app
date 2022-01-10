import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/user_controller.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
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

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    // Show error message if initialization failed
    if (_error) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Checkpoint',
          theme: CheckpointTheme.light(),
          home: const Scaffold(
            body: Center(
              child: Text('An Error Occurred',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ),
          ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Checkpoint',
        theme: CheckpointTheme.light(),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Checkpoint',
        theme: CheckpointTheme.light(),
        home: const HomeScreen() //const LandingScreen(),
        );
  }
}
