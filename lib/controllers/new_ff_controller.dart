import 'package:checkpoint_app2/services/user_service.dart';
import 'package:get/get.dart';

class NewFFController extends GetxController {
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString dob = ''.obs;
  RxString contactNo = ''.obs;
  RxString idNo = ''.obs;
  RxString nationality = ''.obs;
  RxString gender = ''.obs;

  Future<dynamic> addDependant(
    String profileId,
    String firstName,
    String lastName,
    String email,
    String dob,
    String contactNo,
    String idNo,
    String nationality,
    String gender,
  ) async {
    var response = await UserService.addNewDependant(
      profileId,
      firstName,
      lastName,
      email,
      dob,
      contactNo,
      idNo,
      nationality,
      gender,
    );
    return response;
  }
}
