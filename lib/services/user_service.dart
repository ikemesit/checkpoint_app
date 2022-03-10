import 'package:checkpoint_app2/models/partial_user.dart';
import 'package:checkpoint_app2/models/registration_entry.dart';
import 'package:checkpoint_app2/models/user.dart';
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

  static Future<User?> login(String username, String password) async {
    try {
      var response =
          await dioClient.get('/user/authentication/$username/$password');

      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;

        print(data is List);
        print(data is List<dynamic>);

        var dependantTest = List<Dependant>.from(data.map((e) {
          List<dynamic> dependants = e['profileDependentClasses'];
          return List<Dependant>.from(
            dependants.map(
              (d) => Dependant(
                  cName: d['cName'],
                  cFirstName: d['cFirstName'],
                  cLastName: d['cLastName'],
                  cNationality: d['cNationality'],
                  cIDNo: d['cIDNo']),
            ),
          );
        }));

        print(dependantTest);

        var test = List<User>.from(data.map((e) => User(
              lProfileID: e['lProfileID'],
              cName: e['cName'],
              cFirstName: e['cFirstName'],
              cLastName: e['cLastName'],
              cEmailAddress: e['cEmailAddress'],
              cGender: e['cGender'],
              cContactNo: e['cContactNo'],
              cAddress1: e['cAddress1'],
              cAddress2: e['cAddress2'],
              cAddress3: e['cAddress3'],
              cCity: e['cCity'],
              cCountryCode: e['cCountryCode'],
              cDeliveryAddress1: e['cDeliveryAddress1'],
              cDeliveryAddress2: e['cDeliveryAddress2'],
              cDeliveryAddress3: e['cDeliveryAddress3'],
              cDeliveryCity: e['cDeliveryCity'],
              cDeliveryCompanyName: e['cDeliveryCompanyName'],
              cDeliveryCountryCode: e['cDeliveryCountryCode'],
              cDeliveryPostCode: e['cDeliveryPostCode'],
              cDeliveryStateCode: e['cDeliveryStateCode'],
              cEmerContactName: e['cEmerContactName'],
              cEmerContactNo: e['cEmerContactNo'],
              cEmerContactRel: e['cEmerContactRel'],
              cIDNo: e['cIDNo'],
              cMedicalCondition: e['cMedicalCondition'],
              cNationality: e['cNationality'],
              cPostCode: e['cPostCode'],
              cReceiverContactNo: e['cReceiverContactNo'],
              cReceiverName: e['cReceiverName'],
              cStateCode: e['cStateCode'],
              cTokenID: e['cTokenID'],
              cUserID: e['cUserID'],
              profileDependentClasses: e['profileDependentClasses'],
              bFirstTime: e['bFirstTime'],
              bIsLogin: e['bIsLogin'],
              dDOB: e['dDOB'],
            )));
        print(test);

        User user = User(
          lProfileID: data[0].lProfileID,
          cName: data[0].cName,
          cFirstName: data[0].cFirstName,
          cLastName: data[0].cLastName,
          cEmailAddress: data[0].cEmailAddress,
          cGender: data[0].cGender,
          cContactNo: data[0].cContactNo,
          cAddress1: data[0].cAddress1,
          cAddress2: data[0].cAddress2,
          cAddress3: data[0].cAddress3,
          cCity: data[0].cCity,
          cCountryCode: data[0].cCountryCode,
          cDeliveryAddress1: data[0].cDeliveryAddress1,
          cDeliveryAddress2: data[0].cDeliveryAddress2,
          cDeliveryAddress3: data[0].cDeliveryAddress3,
          cDeliveryCity: data[0].cDeliveryCity,
          cDeliveryCompanyName: data[0].cDeliveryCompanyName,
          cDeliveryCountryCode: data[0].cDeliveryCountryCode,
          cDeliveryPostCode: data[0].cDeliveryPostCode,
          cDeliveryStateCode: data[0].cDeliveryStateCode,
          cEmerContactName: data[0].cEmerContactName,
          cEmerContactNo: data[0].cEmerContactNo,
          cEmerContactRel: data[0].cEmerContactRel,
          cIDNo: data[0].cIDNo,
          cMedicalCondition: data[0].cMedicalCondition,
          cNationality: data[0].cNationality,
          cPostCode: data[0].cPostCode,
          cReceiverContactNo: data[0].cReceiverContactNo,
          cReceiverName: data[0].cReceiverName,
          cStateCode: data[0].cStateCode,
          cTokenID: data[0].cTokenID,
          cUserID: data[0].cUserID,
          profileDependentClasses: data[0].profileDependentClasses,
          bFirstTime: data[0].bFirstTime,
          bIsLogin: data[0].bIsLogin,
          dDOB: data[0].dDOB,
        );

        return user;
      } else {
        // Show error
        return null;
      }
    } on DioError catch (e) {
      print(e.response);
    }
  }

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
      print(e.response);
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
