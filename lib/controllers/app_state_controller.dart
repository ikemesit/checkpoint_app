import 'package:get/get.dart';

class AppStateController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool state) {
    _isLoading.value = state;
  }
}
