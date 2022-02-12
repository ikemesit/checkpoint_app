import 'package:checkpoint_app2/models/partial_user.dart';
import 'package:checkpoint_app2/models/registration_entry.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final options = BaseOptions(
    baseUrl: 'https://api.staging.checkpointspot.asia/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {'APIKey': 'ABCD1234', 'Content-Type': 'application/json'});

class UserService {
  static var client = http.Client();
  static Dio dioClient = Dio(options);

  static Future<PartialUser?> update(
      String profileId, PartialUser updates) async {
    var response = await client.put(
        Uri.https('api.staging.checkpointspot.asia',
            '/api/user/updateprofile/$profileId'),
        headers: {'APIKey': 'ABCD1234'},
        body: updates.toJson());

    if (response.statusCode == 200) {
      return updates;
    } else {
      // Show error
      return null;
    }
  }

  static Future<String?> signup(RegistrationEntry registrationEntry) async {
    var registrationPayload = registrationEntryToJson(registrationEntry);
    print(registrationPayload);
    try {
      var response =
          await dioClient.put('/user/signup', data: registrationPayload);
      return response.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.message);
      print(e);
      rethrow;
    }
  }

  static Future<String?> forgotPassword(String email, String idNo) async {
    try {
      var response = await dioClient.put('/user/forgetpassword/$idNo/$email');
      return response.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  static Future<void> addNewDependant(
      String userProfileId,
      String firstName,
      String lastName,
      String email,
      String dob,
      String idNo,
      String contact,
      String nationality,
      String gender) async {
    Map payload = {
      'cName': '$firstName $lastName',
      'cFirstName': firstName,
      'cLastName': lastName,
      'cNationality': nationality,
      'cIDNo': idNo,
      'dDOB': dob,
      'cGender': gender,
      'cContactNo': contact,
      'cEmailAddress': email
    };

    try {
      var response = await dioClient.put('/user/insertffprofile/$userProfileId',
          data: payload);
      return response.data;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
