import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var notificationCount = 10.obs;

  increment() => notificationCount++;
  decrement() => notificationCount--;
}
