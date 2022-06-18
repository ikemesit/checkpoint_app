import 'package:get/get.dart';

class ActivityController extends GetxController {
  RxDouble altitude = 0.0.obs;
  RxString latitude = '0'.obs;
  RxString longitude = '0'.obs;
  RxBool enableLiveTracking = false.obs;
  RxDouble distance = 0.0.obs;
  RxString timeTrackingStarted = ''.obs;
  RxString timeTrackingEnded = ''.obs;
  RxInt stepsTaken = 0.obs;
  RxString timeElasped = '00:00:00:00'.obs;
  RxBool isTrackingPaused = false.obs;
  RxInt rawTime = 0.obs;
}
