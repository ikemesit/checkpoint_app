import 'package:checkpoint_app2/models/event.dart';
import 'package:checkpoint_app2/services/event_service.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  RxBool isLoading = false.obs;
  RxList eventsList = <CheckpointEvent>[].obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  Future<void> fetchEvents() async {
    isLoading.value = true;
    List<CheckpointEvent>? events = await EventService.fetchEvents();

    if (events!.isNotEmpty) {
      events.sort((a, b) => b.dDateTimeFrom.compareTo(a.dDateTimeFrom));
      eventsList.addAll(events);
      isLoading.value = false;
      update();
    }
  }
}
