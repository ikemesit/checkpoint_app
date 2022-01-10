import 'dart:core';

import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/authentication_controller.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/screens/friends_family_screen.dart';
import 'package:checkpoint_app2/screens/login_screen.dart';
import 'package:checkpoint_app2/screens/profile_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final String title;

  const UserProfileScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? _userId;
  String _userFullName = '';
  String? _userFirstName;
  String? _userLastName;
  String? _userIdNo;
  String? _userEmail;
  String? _userPhoneNo;
  String? _userEmergencyContactNo;
  String? _userNationality;
  String? _userAddress1;
  String? _userAddress2;
  String? _userAddress3;
  String? _userDOB;
  String? _userPostCode;
  String? _userCity;
  String? _userStateCode;
  String? _userCountryCode;
  String? _userEmergencyContactName;
  String? _userEmergencyContactRel;
  String? _userMedicalCondition;
  String? _userReceiverName;
  String? _userDeliveryAddress1;
  String? _userDeliveryAddress2;
  String? _userDeliveryAddress3;
  String? _dependants;

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _userId = prefs.getString('username');
      _userFullName = prefs.getString('userFullName') as String;
      _userFirstName = prefs.getString('userFirstName');
      _userLastName = prefs.getString('userLastName');
      _userIdNo = prefs.getString('userIdNo');
      _userEmail = prefs.getString('userEmail');
      _userPhoneNo = prefs.getString('userPhoneNo');
      _userEmergencyContactNo = prefs.getString('userEmergencyContactNo');
      _userNationality = prefs.getString('userNationality');
      _userAddress1 = prefs.getString('userAddress1');
      _userAddress2 = prefs.getString('userAddress2');
      _userAddress3 = prefs.getString('userAddress3');
      _userDOB = prefs.getString('userDOB');
      _userPostCode = prefs.getString('userPostCode');
      _userCity = prefs.getString('userCity');
      _userStateCode = prefs.getString('userStateCode');
      _userCountryCode = prefs.getString('userCountryCode');
      _userEmergencyContactName = prefs.getString('userEmergencyContactName');
      _userEmergencyContactRel = prefs.getString('userEmergencyRel');
      _userMedicalCondition = prefs.getString('userMedicalCondition');
      _userReceiverName = prefs.getString('userReceiverName');
      _userDeliveryAddress1 = prefs.getString('userDeliveryAddress1');
      _userDeliveryAddress2 = prefs.getString('userDeliveryAddress2');
      _userDeliveryAddress3 = prefs.getString('userDeliveryAddress3');
      _dependants = prefs.getString('dependants')!;

      print("in User Profile Screen");
      print(_dependants);
    });
  }

  logoutUser() async {
    final UserController userController = Get.put(UserController());
    final AuthenticationController authController =
        Get.put(AuthenticationController());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userController.userList.clear();
    authController.logout(_userId as String);
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f3f8),
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 2.0,
          shadowColor: Colors.black,
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                    radius: 60.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    _userFullName,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileDetailsScreen(
                                  userId: _userId,
                                  firstName: _userFirstName,
                                  lastName: _userLastName,
                                  emailAddress: _userEmail,
                                  emergencyContactNo: _userEmergencyContactNo,
                                  phoneNo: _userPhoneNo,
                                  idNo: _userIdNo,
                                  nationality: _userNationality,
                                  address1: _userAddress1,
                                  address2: _userAddress2,
                                  address3: _userAddress3,
                                  userDOB: _userDOB,
                                  userPostCode: _userPostCode,
                                  userCity: _userCity,
                                  userStateCode: _userStateCode,
                                  userCountryCode: _userCountryCode,
                                  userEmergencyContactName:
                                      _userEmergencyContactName,
                                  userEmergencyContactRel:
                                      _userEmergencyContactRel,
                                  userMedicalCondition: _userMedicalCondition,
                                  userReceiverName: _userReceiverName,
                                  userDeliveryAddress1: _userDeliveryAddress1,
                                  userDeliveryAddress2: _userDeliveryAddress2,
                                  userDeliveryAddress3: _userDeliveryAddress3,
                                )),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.user),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Profile Details',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                              const Icon(LineIcons.angleRight)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print(_dependants);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendsFamilyScreen(
                              dependants:
                                  dependantFromJson(_dependants as String)),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.users),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Friends & Family',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                              const Icon(LineIcons.angleRight)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final UserController userController =
                          Get.put(UserController());
                      final authController =
                          Get.put(AuthenticationController());
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      userController.userList.clear();
                      authController.logout(_userId!);
                      Get.offAll(LoginScreen());
                    },
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(LineIcons.lock),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    'Logout',
                                    style: CheckpointTheme
                                        .lightTextTheme.headline6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
