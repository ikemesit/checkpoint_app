import 'package:checkpoint_app2/components/text_input.dart';
import 'package:checkpoint_app2/controllers/forgot_password_screen_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';

import '../checkpoint_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.put(UserController());
  final ForgotPasswordScreenController _forgotPasswordScreenController =
      Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    final emailInputController = TextEditingController(
        text: _forgotPasswordScreenController.email.value);
    final idNoInputController =
        TextEditingController(text: _forgotPasswordScreenController.idNo.value);

    initForgotPassword() async {
      final form = _formKey.currentState;

      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      if (form!.validate()) {
        form.save();
        try {
          await _userController.forgotPassword(
              emailInputController.value.text, idNoInputController.value.text);
        } on DioError catch (e) {
          _userController.isLoading.toggle();
          GFToast.showToast(e.message, context,
              toastPosition: GFToastPosition.BOTTOM,
              textStyle: const TextStyle(
                  fontSize: 14,
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
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: const [],
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Forgot Password',
                style: CheckpointTheme.lightTextTheme.headline2,
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextInput(
                  label: 'Enter your email',
                  hintText: 'Enter your email',
                  errorMsg: 'Email field cannot be empty!',
                  onSaved: (String? value) {
                    _forgotPasswordScreenController.email.value = value!;
                  },
                  controller: emailInputController),
              const SizedBox(
                height: 20.0,
              ),
              TextInput(
                  label: 'ID No',
                  hintText: 'Enter your registered IC/Passport number',
                  errorMsg: 'IC/Passport number cannot be empty!',
                  onSaved: (String? value) {
                    _forgotPasswordScreenController.idNo.value = value!;
                  },
                  controller: idNoInputController),
              const SizedBox(
                height: 20.0,
              ),
              Obx(
                () => ElevatedButton(
                  child: _userController.isLoading.value == false
                      ? const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      : const SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                          ),
                        ),
                  onPressed: _userController.isLoading.value == false
                      ? () => initForgotPassword()
                      : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
