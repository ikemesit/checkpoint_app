import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/logout_response.dart';
import 'package:checkpoint_app2/models/user.dart';
import 'package:checkpoint_app2/services/authentication_service.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final RxBool isLoggedIn = false.obs;
  final UserController userController = Get.put(UserController());

  Future<List<User>?> login(String username, String password) async {
    List<User>? user = await AuthenticationService.login(username, password);

    if (user!.isNotEmpty) {
      isLoggedIn.value = user[0].bIsLogin as bool;
      // update();
      userController.setUser(user[0]);
      print("In Auth Controller");
      print(user[0].profileDependentClasses);
      return user;
    }
  }

  Future<LogoutResponse> logout(String username) async {
    isLoggedIn.value = false;

    var res = await AuthenticationService.logout(username) as LogoutResponse;
    return res;
  }
}
