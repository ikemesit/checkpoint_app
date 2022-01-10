import 'package:checkpoint_app2/models/logout_response.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/services/authentication_service.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;
  var userList = <User>[].obs;

  Future<List<User>?> login(String username, String password) async {
    isLoading.value = true;
    List<User>? user = await AuthenticationService.login(username, password);

    if (user != null && user.isNotEmpty) {
      userList.add(user[0]);
      isLoading.value = false;
      isLoggedIn.toggle();
      update();
      return user;
    }
  }

  Future<LogoutResponse> logout(String username) async {
    isLoggedIn.value = false;
    var res = await AuthenticationService.logout(username) as LogoutResponse;
    return res;
  }

  Future<void> setUser(User userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('In User Controller');
    print(userData.profileDependentClasses);

    prefs.setString('username', userData.cUserID as String);
    prefs.setString('userFullName', userData.cName);
    prefs.setString('userFirstName', userData.cFirstName);
    prefs.setString('userLastName', userData.cLastName);
    prefs.setString('userIdNo', userData.cIDNo);
    prefs.setString('userEmail', userData.cEmailAddress as String);
    prefs.setString('userPhoneNo', userData.cContactNo as String);
    prefs.setString(
        'userEmergencyContactNo', userData.cEmerContactNo as String);
    prefs.setString('userNationality', userData.cNationality as String);
    prefs.setString('userAddress1', userData.cAddress1 as String);
    prefs.setString('userAddress2', userData.cAddress2 as String);
    prefs.setString('userAddress3', userData.cAddress3 as String);
    prefs.setString('userCity', userData.cCity as String);
    prefs.setString('userPostCode', userData.cPostCode as String);
    prefs.setString('userDOB', userData.dDOB as String);
    prefs.setString('userPostCode', userData.cPostCode as String);
    prefs.setString('userCity', userData.cCity as String);
    prefs.setString('userStateCode', userData.cStateCode as String);
    prefs.setString('userCountryCode',
        userData.cCountryCode == null ? '' : userData.cCountryCode as String);
    prefs.setString(
        'userEmergencyContactName', userData.cEmerContactName as String);
    prefs.setString('userEmergencyRel', userData.cEmerContactRel as String);
    prefs.setString(
        'userMedicalCondition', userData.cMedicalCondition as String);
    prefs.setString('userReceiverName', userData.cReceiverName as String);
    prefs.setString(
        'userDeliveryAddress1', userData.cDeliveryAddress1 as String);
    prefs.setString(
        'userDeliveryAddress2', userData.cDeliveryAddress2 as String);
    prefs.setString(
        'userDeliveryAddress3', userData.cDeliveryAddress3 as String);
    prefs.setBool('isLoggedIn', userData.bIsLogin as bool);
    prefs.setString('dependants',
        dependantToJson(userData.profileDependentClasses as List<Dependant>));
  }
}
