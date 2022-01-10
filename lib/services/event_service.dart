import 'package:checkpoint_app2/models/event.dart';
import 'package:http/http.dart' as http;

class EventService {
  static var client = http.Client();

  static Future<List<CheckpointEvent>?> fetchEvents() async {
    var response = await client.get(
        Uri.https('api.staging.checkpointspot.asia', '/api/gps/listing'),
        headers: {'apikey': 'ABCD1234'});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return eventFromJson(jsonString);
    } else {
      // Show error
      return null;
    }
  }
}
