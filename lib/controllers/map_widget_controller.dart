import 'package:get/get.dart';

class MapWidgetController extends GetxController {
  RxDouble altitude = 0.0.obs;
  RxString latitude = '0'.obs;
  RxString longitude = '0'.obs;
  RxBool enableLiveTracking = false.obs;
  RxDouble distance = 0.0.obs;
  RxString timeTrackingStarted = ''.obs;
  RxString timeTrackingEnded = ''.obs;
}
