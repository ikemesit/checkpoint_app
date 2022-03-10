import 'package:checkpoint_app2/shared/validation_functions.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:checkpoint_app2/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';

import '../checkpoint_theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _changePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _oldPasswordController =
        TextEditingController();
    final TextEditingController _newPasswordController =
        TextEditingController();

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
              key: _changePasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Change Password',
                    style: CheckpointTheme.lightTextTheme.headline2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextInputWidget(
                      label: 'Old Password',
                      hintText: 'Enter your old password',
                      validatorFn: passwordValidationFn,
                      onChanged: (String? value) {},
                      controller: _oldPasswordController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextInputWidget(
                      label: 'New Password',
                      hintText: 'Enter your new password',
                      validatorFn: passwordValidationFn,
                      onChanged: (String? value) {},
                      controller: _newPasswordController),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () async {
                      final form = _changePasswordFormKey.currentState;

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

                        // var user = await userController.login(
                        //     _username as String, _password as String);
                        //
                        // if (user != null && user.isNotEmpty) {
                        //   Navigator.pop(context);
                        //   GFToast.showToast('Login Successful!', context,
                        //       toastPosition: GFToastPosition.BOTTOM,
                        //       textStyle: const TextStyle(
                        //           fontSize: 16,
                        //           color: GFColors.SUCCESS,
                        //           fontWeight: FontWeight.bold),
                        //       backgroundColor: GFColors.DARK,
                        //       toastBorderRadius: 8.0,
                        //       trailing: const Icon(
                        //         Icons.check,
                        //         color: GFColors.SUCCESS,
                        //       ));
                        //
                        //   await Future.delayed(const Duration(seconds: 2), () {
                        //     Navigator.pop(context);
                        //   });
                        // } else {
                        //   Navigator.pop(context);
                        //   GFToast.showToast('Login Failed!', context,
                        //       toastPosition: GFToastPosition.BOTTOM,
                        //       textStyle: const TextStyle(
                        //           fontSize: 16,
                        //           color: GFColors.DANGER,
                        //           fontWeight: FontWeight.bold),
                        //       backgroundColor: GFColors.DARK,
                        //       toastBorderRadius: 8.0,
                        //       trailing: const Icon(
                        //         Icons.clear,
                        //         color: GFColors.DANGER,
                        //       ));
                        // }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
