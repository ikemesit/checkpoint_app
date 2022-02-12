import 'dart:convert';

List<PartialUser> partialUserFromJson(String str) =>
    List<PartialUser>.from(json.decode(str).map((x) {
      return PartialUser.fromJson(x);
    }));

String partialUserToJson(List<PartialUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartialUser {
  PartialUser({
    this.cName,
    this.cFirstName,
    this.cLastName,
    this.cContactNo,
    this.cEmailAddress,
  });

  String? cName;
  String? cFirstName;
  String? cLastName;
  String? cContactNo;
  String? cEmailAddress;

  factory PartialUser.fromJson(Map<String, dynamic> json) => PartialUser(
        cName: json["cName"] ?? '',
        cFirstName: json["cFirstName"] ?? '',
        cLastName: json["cLastName"] ?? '',
        cContactNo: json["cContactNo"] ?? '',
        cEmailAddress: json["cEmailAddress"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "cName": cName,
        "cFirstName": cFirstName,
        "cLastName": cLastName,
        "cContactNo": cContactNo,
        "cEmailAddress": cEmailAddress,
      };
}
