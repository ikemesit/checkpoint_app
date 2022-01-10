import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) =>
    LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  LogoutResponse({
    required this.message,
  });

  String message;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
      };
}
