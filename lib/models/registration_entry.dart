// To parse this JSON data, do
//
//     final registrationEntry = registrationEntryFromJson(jsonString);

import 'dart:convert';

RegistrationEntry registrationEntryFromJson(String str) =>
    RegistrationEntry.fromJson(json.decode(str));

String registrationEntryToJson(RegistrationEntry data) =>
    json.encode(data.toJson());

class RegistrationEntry {
  RegistrationEntry({
    required this.cName,
    required this.cNationality,
    required this.cIDNo,
    required this.dDOB,
    required this.cGender,
    required this.cContactNo,
    required this.cEmailAddress,
    required this.cUserID,
  });

  String cName;
  String cNationality;
  String cIDNo;
  String dDOB;
  String cGender;
  String cContactNo;
  String cEmailAddress;
  String cUserID;

  factory RegistrationEntry.fromJson(Map<String, dynamic> json) =>
      RegistrationEntry(
        cName: json["cName"],
        cNationality: json["cNationality"],
        cIDNo: json["cIDNo"],
        dDOB: json["dDOB"],
        cGender: json["cGender"],
        cContactNo: json["cContactNo"],
        cEmailAddress: json["cEmailAddress"],
        cUserID: json["cUserID"],
      );

  Map<String, dynamic> toJson() => {
        "cName": cName,
        "cNationality": cNationality,
        "cIDNo": cIDNo,
        "dDOB": dDOB,
        "cGender": cGender,
        "cContactNo": cContactNo,
        "cEmailAddress": cEmailAddress,
        "cUserID": cUserID,
      };
}
