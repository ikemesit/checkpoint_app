import 'package:checkpoint_app2/models/logout_response.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static var client = http.Client();

  static Future<List<User>?> login(String username, String password) async {
    var response = await client.get(
        Uri.https('api.staging.checkpointspot.asia',
            '/api/user/authentication/$username/$password'),
        headers: {'APIKey': 'ABCD1234'});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      // Show error
      return null;
    }
  }

  // static Future<List<User>?> updateUserProfile(
  //     int profileId,
  //     String? name,
  //     String? firstName,
  //     String? lastName,
  //     String? email,
  //     String? contactNo) async {
  //   final payload = {
  //     cName: name,
  //     cFirstName: firstName,
  //   }
  //   var response = await client.put(
  //       Uri.https('api.staging.checkpointspot.asia',
  //           '/api/user/updateprofile/$profileId'),
  //       headers: {'APIKey': 'ABCD1234'},
  //     body:
  //   );
  // }

  static Future<LogoutResponse?> logout(String username) async {
    var response = await client.get(
        Uri.https(
            'api.staging.checkpointspot.asia', '/api/user/logout/$username'),
        headers: {'APIKey': 'ABCD1234'});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return logoutResponseFromJson(jsonString);
    } else {
      // Show error
      return null;
    }
  }
}
