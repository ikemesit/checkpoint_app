import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/partial_user.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_icons/line_icons.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ProfileDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fNameController =
        TextEditingController(text: userController.userList[0].cFirstName);
    TextEditingController lNameController =
        TextEditingController(text: userController.userList[0].cLastName);
    TextEditingController fullNameController =
        TextEditingController(text: userController.userList[0].cName);
    TextEditingController emailController =
        TextEditingController(text: userController.userList[0].cEmailAddress);
    TextEditingController contactController =
        TextEditingController(text: userController.userList[0].cContactNo);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Profile Details',
            style: CheckpointTheme.darkTextTheme.headline4,
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  final form = _formKey.currentState;

                  if (form!.validate()) {
                    form.save();

                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => const LoadingWidget(
                        stateText: 'Saving...',
                      ),
                    );
                    String profileId =
                        userController.userList[0].lProfileID as String;
                    PartialUser userUpdates = PartialUser(
                      cFirstName: fNameController.text,
                      cContactNo: contactController.text,
                      cEmailAddress: emailController.text,
                      cLastName: lNameController.text,
                      cName: userController.userList[0].cName as String,
                    );

                    await userController.updateUser(profileId, userUpdates);

                    Navigator.pop(context);
                    GFToast.showToast('Profile Updated!', context,
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
                  }
                },
                child: Row(
                  children: const [
                    Icon(
                      LineIcons.save,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ))
          ],
          elevation: 2.0,
          shadowColor: Colors.black,
          backgroundColor: const Color(0xFFFAA516),
        ),
        body: Obx(
          () => Form(
            key: _formKey,
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              children: [
                Text('First Name',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  controller: fNameController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your First Name',
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 100) {
                      return 'Field should not be more than 100 characters!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(height: 25.0),
                Text('Last Name',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  controller: lNameController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Last Name',
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 100) {
                      return 'Field should not be more than 100 characters!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(height: 25.0),
                Text('Email', style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.black,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your email',
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 100) {
                      return 'Field should not be more than 100 characters!';
                    }

                    if (EmailValidator.validate(value) != true) {
                      return 'Please enter a valid email!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(height: 25.0),
                Text('Contact Number',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Contact Number',
                    errorStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 20) {
                      return 'Field must not be more than 20 characters!';
                    }

                    if (value.isNumericOnly != true) {
                      return 'Field must only contain numeric characters!';
                    }

                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Emergency Contact Number',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactNo,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Emergency Contact No',
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 100) {
                      return 'Field should not be more than 100 characters!';
                    }

                    if (EmailValidator.validate(value) != true) {
                      return 'Please enter a valid email!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Address (Line 1)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cAddress1,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Address',
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }

                    if (value.length > 100) {
                      return 'Field should not be more than 100 characters!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Address (Line 2)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cAddress2,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Address (Line 3)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cAddress3,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Date of birth',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                FormBuilderDateTimePicker(
                  name: 'Date of birth',
                  onChanged: (DateTime? dateTime) {
                    print(Jiffy(dateTime).format("yyyy-MM-dd"));
                    // return Jiffy(dateTime, "yyyy-MM-dd");
                  },
                  inputType: InputType.date,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                  format: DateFormat("yyyy-MM-dd"),
                  initialDate: DateTime.now(),
                  initialValue: Jiffy(userController.userList[0].dDOB).dateTime,
                  valueTransformer: (DateTime? dateTime) {
                    return Jiffy(dateTime).format("yyyy-MM-dd");
                  },
                ),
                // TextFormField(
                //   initialValue: userController.userList[0].dDOB,
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     label: Text(
                //       'Date of Birth',
                //       style: CheckpointTheme.lightTextTheme.headline5,
                //     ),
                //     contentPadding: const EdgeInsets.symmetric(
                //         vertical: 10.0, horizontal: 15.0),
                //     filled: false,
                //     fillColor: Colors.white,
                //     border: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0))),
                //   ),
                // ),
                const SizedBox(height: 25.0),
                Text('Post Code',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cPostCode,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('City', style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cCity,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('State', style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cStateCode,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Country',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cCountryCode,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Emergency Contact Name',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactName,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Emergency Contact Relation',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactRel,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Existing medical conditions',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cMedicalCondition,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Receiver Name',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cReceiverName,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Delivery Address (Line 1)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress1,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text('Delivery Address (Line 2)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress2,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text('Delivery Address (Line 3)',
                    style: CheckpointTheme.lightTextTheme.headline5),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress3,
                  readOnly: true,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
