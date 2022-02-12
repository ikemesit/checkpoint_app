import 'package:get/get.dart';

class EventDetailController extends GetxController {
  RxInt position = 1.obs;
  RxDouble webViewHeight = 100.0.obs;

  void updatePosition(int val) {
    position.value = val;
  }

  void updateWebViewHeight(double val) {
    webViewHeight.value = val;
  }
}
