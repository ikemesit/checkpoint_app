import 'package:checkpoint_app2/controllers/notifications_controller.dart';
import 'package:checkpoint_app2/widgets/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkpoint_theme.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);
  final notificationsController = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: CheckpointTheme.darkTextTheme.headline4,
        ),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: notificationsController.notificationCount.value,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCardWidget();
            }),
      ),
    );
  }
}
