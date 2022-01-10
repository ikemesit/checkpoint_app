import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/authentication_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/screens/home_screen.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_icons/line_icons.dart';

import 'notifications_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());
  final AuthenticationController authController =
      Get.put(AuthenticationController());
  final store = GetStorage();

  String? _username;
  String? _password;
  List<User> userData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Detail',
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
      body: Obx(() {
        if (userController.isLoggedIn.value == false) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.blueGrey, BlendMode.multiply),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/landing_bg.webp')),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                          child: Image(
                            alignment: Alignment.center,
                            width: 250,
                            image: AssetImage('assets/images/logo.webp'),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25.0),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(36.0))),
                            hintText: 'Enter your Username',
                            errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid username!';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25.0),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(36.0))),
                            hintText: 'Enter your password',
                            errorStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid password!';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final form = _formKey.currentState;

                            if (form!.validate()) {
                              form.save();

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const LoadingWidget(
                                  stateText: 'Signing In',
                                ),
                              );

                              await userController.login(
                                  _username as String, _password as String);

                              Get.back();

                              // if (authController.isLoggedIn.value == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text('Wrong Credentials!'),
                                  backgroundColor: Theme.of(context).errorColor,
                                ),
                              );
                              // }
                            }
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: CheckpointTheme.darkTextTheme.headline6,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.center,
                            style: CheckpointTheme.darkTextTheme.headline6,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }

        // userController.setUser(userData[0]);
        Get.back(closeOverlays: true);
        return const HomeScreen();
      }),
    );
  }
}
