import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? idNo;
  final String? emailAddress;
  final String? phoneNo;
  final String? emergencyContactNo;
  final String? nationality;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? userDOB;
  final String? userPostCode;
  final String? userCity;
  final String? userStateCode;
  final String? userCountryCode;
  final String? userEmergencyContactName;
  final String? userEmergencyContactRel;
  final String? userMedicalCondition;
  final String? userReceiverName;
  final String? userDeliveryAddress1;
  final String? userDeliveryAddress2;
  final String? userDeliveryAddress3;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ProfileDetailsScreen({
    Key? key,
    this.userId,
    this.firstName,
    this.lastName,
    this.idNo,
    this.emailAddress,
    this.phoneNo,
    this.emergencyContactNo,
    this.nationality,
    this.address1,
    this.address2,
    this.address3,
    this.userDOB,
    this.userPostCode,
    this.userCity,
    this.userStateCode,
    this.userCountryCode,
    this.userEmergencyContactName,
    this.userEmergencyContactRel,
    this.userMedicalCondition,
    this.userReceiverName,
    this.userDeliveryAddress1,
    this.userDeliveryAddress2,
    this.userDeliveryAddress3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // final form = _formKey.currentState;

                // if (form!.validate()) {
                //   form.save();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const LoadingWidget(
                    stateText: 'Saving...',
                  ),
                );

                // Duration(
                //     seconds: 4,
                //         () {
                //       Navigator.pop(context)
                //     }
                // );
              },
              // },
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
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        // key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          children: [
            TextFormField(
              initialValue: firstName,
              decoration: InputDecoration(
                label: Text(
                  'First Name',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    // borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.all(Radius.circula0)),
                    ),
                hintText: 'Enter your First Name',
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
              height: 20.0,
            ),
            TextFormField(
              initialValue: lastName,
              decoration: InputDecoration(
                label: Text(
                  'Last Name',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    // borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.all(Radius.circula0)),
                    ),
                hintText: 'Enter your Last Name',
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
              height: 20.0,
            ),
            TextFormField(
              initialValue: emailAddress,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    // borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.all(Radius.circula0)),
                    ),
                hintText: 'Enter your email',
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
              height: 20.0,
            ),
            TextFormField(
              initialValue: phoneNo,
              decoration: InputDecoration(
                label: Text(
                  'Contact No',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    // borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.all(Radius.circula0)),
                    ),
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
              height: 20.0,
            ),
            TextFormField(
              initialValue: emergencyContactNo,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Emergency Contact No',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    // borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.all(Radius.circula0)),
                    ),
                hintText: 'Enter your Emergency Contact No',
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
              height: 20.0,
            ),
            TextFormField(
              initialValue: address1,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Address (Line 1)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Address',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: address2,
              readOnly: false, // TODO Remove later
              decoration: InputDecoration(
                label: Text(
                  'Address (Line 2)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Address',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: address3,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Address (Line 3)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Address',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userDOB,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Date of Birth',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your birth date',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userPostCode,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Post Code',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your post code',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userCity,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'City',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your City',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userStateCode,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'State',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your State',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userCountryCode,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Country',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Country',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userEmergencyContactName,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Emergency Contact Name',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Emergency Contact\'s name',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userEmergencyContactRel,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Emergency Contact Relation',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your emergency contact\'s relation',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userMedicalCondition,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Existing medical conditions',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter any existing medical condition',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userReceiverName,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Receiver Name',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your designated receiver\'s name',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userDeliveryAddress1,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Delivery Address (Line 1)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Delivery Address',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userDeliveryAddress2,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Delivery Address (Line 2)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Delivery Address',
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              initialValue: userDeliveryAddress3,
              readOnly: false,
              decoration: InputDecoration(
                label: Text(
                  'Delivery Address (Line 3)',
                  style: CheckpointTheme.lightTextTheme.headline6,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                filled: false,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(),
                hintText: 'Enter your Delivery Address',
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
            ),
          ],
        ),
      ),
    );
  }
}
