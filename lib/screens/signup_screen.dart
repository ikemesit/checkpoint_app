import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/registration_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/registration_entry.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';

enum Gender { male, female, other }

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());
  final RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //const Color(0xfff2f3f8),
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
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Username',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Lee',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty!';
                    }

                    if (value.length < 6 || value.length > 12) {
                      return 'Username must be between 6 - 12 characters length!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.username.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Full Name',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Lee Chen',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'full name cannot be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.fullName.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Date of birth',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'YYYY-MM-DD',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Contact number cannot be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.dob.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Email',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'lee@checkpointspot.asia',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.email.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'Contact No',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: '+60123456789',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Contact number cannot be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.contactNo.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      'IC/Passport No',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'CHCK1234567890',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ic/Passport cannot be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registrationController.icNo.value = value!;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: const Color(0xfff2f3f8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CountryListPick(
                      appBar: AppBar(
                        iconTheme: const IconThemeData(
                          color: Colors.black,
                        ),
                        actions: const [],
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.white,
                        title: const Text('Select a country'),
                      ),
                      theme: CountryTheme(
                        labelColor: Colors.black,
                        isShowFlag: true,
                        isShowTitle: true,
                        isShowCode: false,
                        isDownIcon: true,
                        showEnglishName: true,
                      ),
                      initialSelection: 'MY',
                      onChanged: (CountryCode? code) {
                        registrationController.nationality.value =
                            code != null ? code.code as String : '';
                      },
                      useUiOverlay: true,
                      useSafeArea: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Gender',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Male'),
                                Radio<String>(
                                  value: 'M',
                                  groupValue:
                                      registrationController.gender.value,
                                  onChanged: (String? value) {
                                    registrationController.gender.value =
                                        value!;
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Female'),
                                Radio<String>(
                                  value: 'F',
                                  groupValue:
                                      registrationController.gender.value,
                                  onChanged: (String? value) {
                                    registrationController.gender.value =
                                        value!;
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
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

                      RegistrationEntry newRegistrationEntry =
                          RegistrationEntry(
                              cName: registrationController.fullName.value,
                              cNationality:
                                  registrationController.nationality.value,
                              cIDNo: registrationController.icNo.value,
                              dDOB: registrationController.dob.value,
                              cGender: registrationController.gender.value,
                              cContactNo:
                                  registrationController.contactNo.value,
                              cEmailAddress: registrationController.email.value,
                              cUserID: registrationController.username.value);

                      String? response;
                      try {
                        response =
                            await userController.signup(newRegistrationEntry);
                      } on DioError catch (e) {
                        print(e);
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
