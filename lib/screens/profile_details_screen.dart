import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/partial_user.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              children: [
                TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                    label: Text(
                      'First Name',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your First Name',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: lNameController,
                  decoration: InputDecoration(
                    label: Text(
                      'Last Name',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Last Name',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your email',
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    label: Text(
                      'Contact No',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.red,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Contact Number',
                    errorStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not be empty!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    // _username = value;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactNo,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Emergency Contact No',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Emergency Contact No',
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cAddress1,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Address (Line 1)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Enter your Address',
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cAddress2,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Address (Line 2)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cAddress3,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Address (Line 3)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].dDOB,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Date of Birth',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cPostCode,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Post Code',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cCity,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'City',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cStateCode,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'State',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cCountryCode,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Country',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactName,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Emergency Contact Name',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cEmerContactRel,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Emergency Contact Relation',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cMedicalCondition,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Existing medical conditions',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cReceiverName,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Receiver Name',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress1,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Delivery Address (Line 1)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress2,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Delivery Address (Line 2)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: userController.userList[0].cDeliveryAddress3,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Delivery Address (Line 3)',
                      style: CheckpointTheme.lightTextTheme.headline5,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
