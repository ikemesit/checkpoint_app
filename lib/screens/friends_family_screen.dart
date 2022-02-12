import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/screens/new_ff_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../checkpoint_theme.dart';

class FriendsFamilyScreen extends StatelessWidget {
  FriendsFamilyScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Friends & Family',
          style: CheckpointTheme.darkTextTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => NewFF(), fullscreenDialog: true);
              },
              icon: const Icon(LineIcons.plus))
        ],
      ),
      body: Obx(() => ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 4),
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            itemCount:
                userController.userList[0].profileDependentClasses!.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                  radius: 20.0),
              title: Text(
                userController
                    .userList[0].profileDependentClasses![index].cName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                userController.userList[0].profileDependentClasses![index]
                        .cContactNo ??
                    '',
              ),
              tileColor: Colors.white,
              trailing: const Icon(LineIcons.angleRight),
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0))),
                  backgroundColor: Colors.white,
                  builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'First Name:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                      .userList[0]
                                      .profileDependentClasses![index]
                                      .cFirstName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Last Name:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                      .userList[0]
                                      .profileDependentClasses![index]
                                      .cLastName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Contact No:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cContactNo ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Gender',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cGender ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cEmailAddress ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Date of Birth',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .dDOB ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Address(1)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cAddress1 ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Address(2)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cAddress2 ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Address(3)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cAddress3 ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Post Code',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cPostCode ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'City',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  userController
                                          .userList[0]
                                          .profileDependentClasses![index]
                                          .cCity ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
