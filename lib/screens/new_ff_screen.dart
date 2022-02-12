import 'package:checkpoint_app2/components/text_input.dart';
import 'package:checkpoint_app2/controllers/new_ff_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkpoint_theme.dart';

class NewFF extends StatelessWidget {
  NewFF({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());
  final NewFFController newFFController = Get.put(NewFFController());

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController =
        TextEditingController(text: newFFController.firstName.value);
    TextEditingController lastNameController =
        TextEditingController(text: newFFController.lastName.value);
    TextEditingController idNoController =
        TextEditingController(text: newFFController.idNo.value);
    TextEditingController emailController =
        TextEditingController(text: newFFController.email.value);
    TextEditingController dobController =
        TextEditingController(text: newFFController.dob.value);
    TextEditingController contactController =
        TextEditingController(text: newFFController.contactNo.value);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Entry',
          style: CheckpointTheme.darkTextTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextInput(
                    label: 'First Name',
                    hintText: 'Enter first name',
                    errorMsg: 'First name cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.firstName.value =
                          firstNameController.value.text;
                    },
                    controller: firstNameController),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                    label: 'Last Name',
                    hintText: 'Enter last name',
                    errorMsg: 'Last name cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.lastName.value =
                          lastNameController.value.text;
                    },
                    controller: lastNameController),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                    label: 'IC No/Passport No',
                    hintText: 'IC No or Passport No',
                    errorMsg: 'Field cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.idNo.value = idNoController.value.text;
                    },
                    controller: idNoController),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                    label: 'Email',
                    hintText: 'Enter email',
                    errorMsg: 'Email cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.email.value = emailController.value.text;
                    },
                    controller: emailController),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                    label: 'Date of birth',
                    hintText: 'Enter date of birth (YYYY-MM-DD)',
                    errorMsg: 'Date of birth cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.dob.value = dobController.value.text;
                    },
                    controller: dobController),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                    label: 'Contact No',
                    hintText: 'Enter contact number',
                    errorMsg: 'Contact number cannot be empty!',
                    onSaved: (String? value) {
                      newFFController.contactNo.value =
                          contactController.value.text;
                    },
                    controller: contactController),
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
                        newFFController.nationality.value =
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Male'),
                                Radio<String>(
                                  value: 'M',
                                  groupValue: newFFController.gender.value,
                                  onChanged: (String? value) {
                                    newFFController.gender.value = value!;
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
                                  groupValue: newFFController.gender.value,
                                  onChanged: (String? value) {
                                    newFFController.gender.value = value!;
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
                    'Save',
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
                          stateText: 'Saving...',
                        ),
                      );

                      String userId =
                          userController.userList[0].cUserID as String;
                      String firstName = newFFController.firstName.value;
                      String lastName = newFFController.lastName.value;
                      String email = newFFController.email.value;
                      String dob = newFFController.dob.value;
                      String idNo = newFFController.idNo.value;
                      String contact = newFFController.contactNo.value;
                      String nationality = newFFController.nationality.value;
                      String gender = newFFController.gender.value;

                      try {
                        var response = await userController.addDependant(
                          userId,
                          firstName,
                          lastName,
                          email,
                          dob,
                          idNo,
                          contact,
                          nationality,
                          gender,
                        );

                        print(response);

                        Navigator.pop(context);
                      } on DioError catch (e) {
                        print(e.message);
                      }

                      // var user = await userController.login(
                      //     _username as String, _password as String);

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
      ),
    );
  }
}
