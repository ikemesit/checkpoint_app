import 'package:checkpoint_app2/components/notification_card.dart';
import 'package:checkpoint_app2/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);
  final notificationsController = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepOrange,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: notificationsController.notificationCount.value,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCard();
            }),
      ),
    );
  }
}
