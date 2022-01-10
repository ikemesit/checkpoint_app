import 'package:checkpoint_app2/models/event.dart';
import 'package:checkpoint_app2/services/remote_services.dart';
import 'package:get/state_manager.dart';

class EventController extends GetxController {
  var isLoading = true.obs;
  var eventList = <CheckpointEvent>[].obs;

  @override
  void onInit() {
    try {
      fetchEvents();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  void fetchEvents() async {
    try {
      isLoading(true);
      var events = await RemoteServices.fetchEvents();
      isLoading(false);
      if (events != null) {
        eventList.value = events;
      }
    } finally {
      isLoading(false);
    }
  }

  // void fetchEvent(String eventCode) async {}
}
