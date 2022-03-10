// To parse this JSON data, do
//
//     final signupError = signupErrorFromJson(jsonString);

import 'dart:convert';

List<SignupError> signupErrorFromJson(String str) => List<SignupError>.from(
    json.decode(str).map((x) => SignupError.fromJson(x)));

String signupErrorToJson(List<SignupError> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignupError {
  SignupError({
    required this.iLineNo,
    required this.cErrorMessage,
  });

  int iLineNo;
  String cErrorMessage;

  factory SignupError.fromJson(Map<String, dynamic> json) => SignupError(
        iLineNo: json["iLineNo"],
        cErrorMessage: json["cErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "iLineNo": iLineNo,
        "cErrorMessage": cErrorMessage,
      };
}
