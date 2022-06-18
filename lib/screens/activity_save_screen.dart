import 'package:checkpoint_app2/components/text_input.dart';
import 'package:checkpoint_app2/controllers/activity_controller.dart';
import 'package:checkpoint_app2/screens/activity_screen.dart';
import 'package:checkpoint_app2/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkpoint_theme.dart';

class ActivitySaveScreen extends StatelessWidget {
  const ActivitySaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityController _mapWidgetController =
        Get.find<ActivityController>();
    CollectionReference activities =
        FirebaseFirestore.instance.collection('leaderboardResults');

    TextEditingController nameController = TextEditingController();
    TextEditingController activityLabelController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    Future<void> saveActivity() {
      return activities
          .add({
            'name': nameController.text,
            'label': activityLabelController.text,
            'description': descriptionController.text,
            'time': _mapWidgetController.timeElasped.value,
            'distanceCovered': _mapWidgetController.distance.value,
            'dateTime': Timestamp.fromDate(DateTime.now())
          })
          .then((value) => print("Result Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

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
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activity Ended!',
                style: CheckpointTheme.lightTextTheme.headline2,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time Elapsed',
                          style: CheckpointTheme.lightTextTheme.headline5),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(_mapWidgetController.timeElasped.value,
                          style: CheckpointTheme.lightTextTheme.bodyText2)
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Distance covered',
                          style: CheckpointTheme.lightTextTheme.headline5),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(_mapWidgetController.distance.value.toString(),
                          style: CheckpointTheme.lightTextTheme.bodyText2)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Name',
                style: CheckpointTheme.lightTextTheme.headline4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextInput(
                label: 'Label',
                hintText: 'Please enter your name',
                errorMsg: '',
                onSaved: (String? value) {},
                controller: nameController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Title',
                style: CheckpointTheme.lightTextTheme.headline4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextInput(
                label: 'Label',
                hintText: 'What would you like to save your activity as',
                errorMsg: '',
                onSaved: (String? value) {},
                controller: activityLabelController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Description',
                style: CheckpointTheme.lightTextTheme.headline4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                maxLines: 10,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await saveActivity();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const LoadingWidget(
                          stateText: 'Saving Session',
                        ),
                      );

                      await Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                        Get.off(() => ActivityScreen());
                      });
                    },
                    child: Text(
                      'Save Activity',
                      style: CheckpointTheme.darkTextTheme.headline5,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.back(closeOverlays: true);
                    },
                    child: Text(
                      'Cancel',
                      style: CheckpointTheme.lightTextTheme.headline4,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
