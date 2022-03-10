import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/registration_entry.dart';
import 'package:checkpoint_app2/shared/validation_functions.dart';
import 'package:checkpoint_app2/widgets/country_selector_widget.dart';
import 'package:checkpoint_app2/widgets/date_input_widget.dart';
import 'package:checkpoint_app2/widgets/gender_selector_widget.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:checkpoint_app2/widgets/text_input_widget.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());

  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _icNoController = TextEditingController();
  final TextEditingController _genderController =
      TextEditingController(text: 'Male');
  final TextEditingController _countryCodeController =
      TextEditingController(text: 'MY');

  final _genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
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
                  'Sign Up User',
                  style: CheckpointTheme.lightTextTheme.headline2,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextInputWidget(
                  controller: _usernameController,
                  label: 'Username',
                  hintText: 'Enter your username',
                  validatorFn: usernameValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInputWidget(
                  controller: _fnameController,
                  label: 'First Name',
                  hintText: 'Enter your first name',
                  validatorFn: firstNameValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInputWidget(
                  controller: _lnameController,
                  label: 'Last Name',
                  hintText: 'Enter your last name',
                  validatorFn: lastNameValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DateInputWidget(
                  label: 'Date of birth',
                  initialValue: DateTime.now(),
                  initialDate: DateTime.now(),
                  controller: _dobController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInputWidget(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  validatorFn: emailValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInputWidget(
                  controller: _contactNoController,
                  label: 'Contact No',
                  hintText: 'Enter your contact number',
                  validatorFn: contactNoValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInputWidget(
                  controller: _icNoController,
                  label: 'IC/Passport No',
                  hintText: 'Enter your IC/Passport number',
                  validatorFn: icNoValidationFn,
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CountrySelectorWidget(controller: _countryCodeController),
                const SizedBox(
                  height: 20.0,
                ),
                GenderSelectorWidget(
                    controller: _genderController,
                    validationFn: genderValidationFn),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  child: const Text(
                    'Sign Up',
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
                          stateText: 'Signing Up',
                        ),
                      );

                      RegistrationEntry newRegistrationEntry = RegistrationEntry(
                          cFirstName: _fnameController.text,
                          cLastName: _lnameController.text,
                          cName:
                              '${_fnameController.text} ${_lnameController.text}',
                          cNationality: _countryCodeController.text,
                          cIDNo: _icNoController.text,
                          dDOB: _dobController.text,
                          cGender: _genderController.text.toLowerCase(),
                          cContactNo: _contactNoController.text,
                          cEmailAddress: _emailController.text,
                          cUserID: _usernameController.text);

                      print(newRegistrationEntry.toJson());

                      String? response;
                      dio.Response? error;

                      try {
                        response =
                            await userController.signup(newRegistrationEntry);
                      } on dio.DioError catch (e) {
                        error = e.response;
                        // print(error?.data[0]['cErrorMessage']);
                      }

                      if (response != null) {
                        Navigator.pop(context);
                        GFToast.showToast('Registration Successful!', context,
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
                          Navigator.pop(context);
                        });
                      } else {
                        Navigator.pop(context);
                        GFToast.showToast(
                            'An error occurred! Please check and retry again...',
                            context,
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
              ],
            ),
          ),
        ));
  }
}
