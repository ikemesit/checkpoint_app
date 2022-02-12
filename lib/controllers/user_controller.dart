import 'package:checkpoint_app2/models/logout_response.dart';
import 'package:checkpoint_app2/models/partial_user.dart';
import 'package:checkpoint_app2/models/registration_entry.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/services/authentication_service.dart';
import 'package:checkpoint_app2/services/user_service.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;
  RxList userList = <User>[].obs;
  RxBool trackScreenLoaded = false.obs;
  RxInt activityChoice = 1.obs;

  var activityChoices = <int, String>{0: 'WALKING', 1: 'RUNNING', 2: 'CYCLING'};

  Future<List<User>?> login(String username, String password) async {
    isLoading.toggle();
    List<User>? user = await AuthenticationService.login(username, password);

    if (user != null && user.isNotEmpty) {
      userList.add(user[0]);
      isLoading.toggle();
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

  Future<void> updateUser(String profileId, PartialUser updates) async {
    PartialUser? userUpdates = await UserService.update(profileId, updates);

    if (userUpdates != null) {
      userList[0].cFirstName = userUpdates.cFirstName;
      userList[0].cLastName = userUpdates.cLastName;
      userList[0].cName = userUpdates.cName;
      userList[0].cContactNo = userUpdates.cContactNo;
      userList[0].cEmailAddress = userUpdates.cEmailAddress;
    }
  }

  Future<String?> signup(RegistrationEntry registrationEntry) async {
    String? response = await UserService.signup(registrationEntry);
    return response;
  }

  Future<String?> forgotPassword(String email, String idNo) async {
    isLoading.toggle();
    String? response = await UserService.forgotPassword(email, idNo);
    isLoading.toggle();
    return response;
  }

  Future<String?> addDependant(
      String userProfileId,
      String firstName,
      String lastName,
      String email,
      String dob,
      String idNo,
      String contact,
      String nationality,
      String gender) async {
    isLoading.toggle();
    await UserService.addNewDependant(userProfileId, firstName, lastName, email,
        dob, idNo, contact, nationality, gender);

    userList[0].profileDependentClasses?.add(
          Dependant(
              cName: '$firstName $lastName',
              cFirstName: firstName,
              cLastName: lastName,
              cNationality: nationality,
              cIDNo: idNo,
              cContactNo: contact,
              cGender: gender,
              dDOB: dob,
              cEmailAddress: email),
        );
  }
}
