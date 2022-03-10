import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/screens/change_password_screen.dart';
import 'package:checkpoint_app2/screens/forgot_password_screen.dart';
import 'package:checkpoint_app2/screens/signup_screen.dart';
import 'package:checkpoint_app2/shared/validation_functions.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:checkpoint_app2/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<User> userData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: const [],
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: CheckpointTheme.lightTextTheme.headline2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextInputWidget(
                      label: 'Username',
                      hintText: 'Enter your username',
                      validatorFn: usernameValidationFn,
                      onChanged: (String? value) {},
                      controller: _usernameController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextInputWidget(
                    label: 'Password',
                    hintText: 'Enter your password',
                    validatorFn: passwordValidationFn,
                    onChanged: (String? value) {},
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () async {
                      final form = _formKey.currentState;

                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      if (form!.validate()) {
                        form.save();

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const LoadingWidget(
                            stateText: 'Signing In',
                          ),
                        );

                        var user = await userController.login(
                            _usernameController.text, _passwordController.text);

                        if (user != null && user.isNotEmpty) {
                          print(user[0].bFirstTime);
                          Navigator.pop(context);
                          GFToast.showToast('Login Successful!', context,
                              toastPosition: GFToastPosition.BOTTOM,
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: GFColors.SUCCESS,
                                  fontWeight: FontWeight.bold),
                              backgroundColor: GFColors.DARK,
                              toastBorderRadius: 8.0,
                              trailing: const Icon(
                                Icons.check,
                                color: GFColors.SUCCESS,
                              ));

                          await Future.delayed(const Duration(seconds: 2), () {
                            if (user[0].bFirstTime != null &&
                                user[0].bFirstTime == true) {
                              Get.off(() => ChangePasswordScreen(),
                                  fullscreenDialog: true);
                            }
                            Navigator.pop(context);
                          });
                        } else {
                          Navigator.pop(context);
                          GFToast.showToast('Login Failed!', context,
                              toastPosition: GFToastPosition.BOTTOM,
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: GFColors.DANGER,
                                  fontWeight: FontWeight.bold),
                              backgroundColor: GFColors.DARK,
                              toastBorderRadius: 8.0,
                              trailing: const Icon(
                                Icons.clear,
                                color: GFColors.DANGER,
                              ));
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPasswordScreen(),
                                fullscreenDialog: true);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: CheckpointTheme.lightTextTheme.bodyText1,
                          )),
                      TextButton(
                          onPressed: () {
                            Get.to(() => SignUpScreen(),
                                fullscreenDialog: true);
                          },
                          child: Text(
                            'Sign Up',
                            style: CheckpointTheme.lightTextTheme.bodyText1,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
