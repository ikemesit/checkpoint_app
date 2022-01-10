import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FriendsFamilyScreen extends StatelessWidget {
  FriendsFamilyScreen({Key? key, required this.dependants}) : super(key: key);

  final List<dynamic> dependants;

  @override
  Widget build(BuildContext context) {
    print("in friends and family");
    print(dependants[0].toString());
    return Scaffold(
      backgroundColor: const Color(0xfff2f3f8),
      appBar: AppBar(
        title: const Text(
          'Friends & Family',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 4),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        itemCount: dependants.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          title: Text(
            dependants[index]?.cName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(dependants[index]?.cContactNo),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(LineIcons.eraser),
                                color: Colors.deepOrange,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(LineIcons.edit),
                                color: Colors.deepOrange,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(LineIcons.save),
                                color: Colors.deepOrange,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(LineIcons.plus),
                                color: Colors.deepOrange,
                              ),
                              const Text(
                                'Add new entry',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'First Name:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(dependants[index]?.cFirstName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
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
                          Text(dependants[index]?.cLastName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
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
                          Text(dependants[index]?.cContactNo,
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
                          Text(dependants[index]?.cGender,
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
                          Text(dependants[index]?.cEmailAddress,
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
                          Text(dependants[index]?.dDOB,
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
                          Text(dependants[index]?.cAddress1,
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
                          Text(dependants[index]?.cAddress2,
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
                          Text(dependants[index]?.cAddress3,
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
                          Text(dependants[index]?.cPostCode,
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
                          Text(dependants[index]?.cCity,
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
      ),
    );
  }
}
