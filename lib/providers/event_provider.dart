import 'package:get/get_connect/connect.dart';

class EventProvider extends GetConnect {
  Future<Response> getUser(int id) => get('http://youapi/users/$id');
  Future<Response> postUser(Map data) => post('http://youapi/users', data);

  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }
}
