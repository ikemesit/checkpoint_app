import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) {
      return User.fromJson(x);
    }));

List<dynamic> dependantFromJson(String str) =>
    List<dynamic>.from(json.decode(str).map((x) {
      return Dependant.fromJson(x);
    }));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String dependantToJson(List<Dependant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.lProfileID,
    required this.cName,
    required this.cFirstName,
    required this.cLastName,
    required this.cIDNo,
    this.cUserID,
    this.bFirstTime,
    this.bIsLogin,
    this.cNationality,
    this.dDOB,
    this.cGender,
    this.cAddress1,
    this.cAddress2,
    this.cAddress3,
    this.cPostCode,
    this.cCity,
    this.cStateCode,
    this.cCountryCode,
    this.cContactNo,
    this.cEmailAddress,
    this.cEmerContactName,
    this.cEmerContactRel,
    this.cEmerContactNo,
    this.cMedicalCondition,
    this.cReceiverName,
    this.cReceiverContactNo,
    this.cDeliveryCompanyName,
    this.cDeliveryAddress1,
    this.cDeliveryAddress2,
    this.cDeliveryAddress3,
    this.cDeliveryPostCode,
    this.cDeliveryCity,
    this.cDeliveryStateCode,
    this.cDeliveryCountryCode,
    this.profileDependentClasses,
  });

  String lProfileID;
  String cName;
  String cIDNo;
  String? cUserID;
  String cFirstName;
  String cLastName;
  bool? bFirstTime;
  bool? bIsLogin;
  String? cNationality;
  String? dDOB;
  String? cGender;
  String? cAddress1;
  String? cAddress2;
  String? cAddress3;
  String? cPostCode;
  String? cCity;
  String? cStateCode;
  String? cCountryCode;
  String? cContactNo;
  String? cEmailAddress;
  String? cEmerContactName;
  String? cEmerContactRel;
  String? cEmerContactNo;
  String? cMedicalCondition;
  String? cReceiverName;
  String? cReceiverContactNo;
  String? cDeliveryCompanyName;
  String? cDeliveryAddress1;
  String? cDeliveryAddress2;
  String? cDeliveryAddress3;
  String? cDeliveryPostCode;
  String? cDeliveryCity;
  String? cDeliveryStateCode;
  String? cDeliveryCountryCode;
  List<Dependant>? profileDependentClasses;

  factory User.fromJson(Map<String, dynamic> json) => User(
        lProfileID: '{$json["lProfileID"]}',
        cName: json["cName"],
        cIDNo: json["cIDNo"],
        cUserID: json["cUserID"],
        bFirstTime: json["bFirstTime"],
        bIsLogin: json["bIsLogin"],
        cFirstName: json["cFirstName"],
        cLastName: json["cLastName"],
        cNationality: json["cNationality"],
        dDOB: json["dDOB"],
        cGender: json["cGender"],
        cAddress1: json["cAddress1"],
        cAddress2: json["cAddress2"],
        cAddress3: json["cAddress3"],
        cPostCode: json["cPostCode"],
        cCity: json["cCity"],
        cStateCode: json["cStateCode"],
        cCountryCode: json["cCountryCode"],
        cContactNo: json["cContactNo"],
        cEmailAddress: json["cEmailAddress"],
        cEmerContactName: json["cEmerContactName"],
        cEmerContactRel: json["cEmerContactRel"],
        cEmerContactNo: json["cEmerContactNo"],
        cMedicalCondition: json["cMedicalCondition"],
        cReceiverName: json["cReceiverName"],
        cReceiverContactNo: json["cReceiverContactNo"],
        cDeliveryCompanyName: json["cDeliveryCompanyName"],
        cDeliveryAddress1: json["cDeliveryAddress1"],
        cDeliveryAddress2: json["cDeliveryAddress2"],
        cDeliveryAddress3: json["cDeliveryAddress3"],
        cDeliveryPostCode: json["cDeliveryPostCode"],
        cDeliveryCity: json["cDeliveryCity"],
        cDeliveryStateCode: json["cDeliveryStateCode"],
        cDeliveryCountryCode: json["cDeliveryCountryCode"],
        profileDependentClasses: json["profileDependentClasses"] == null
            ? null
            : List<Dependant>.from(json["profileDependentClasses"]
                .map((x) => Dependant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lProfileID": lProfileID,
        "cName": cName,
        "cIDNo": cIDNo,
        "cUserID": cUserID,
        "bFirstTime": bFirstTime,
        "bIsLogin": bIsLogin,
        "cNationality": cNationality,
        "cFirstName": cFirstName,
        "cLastName": cLastName,
        "dDOB": dDOB,
        "cGender": cGender,
        "cAddress1": cAddress1,
        "cAddress2": cAddress2,
        "cAddress3": cAddress3,
        "cPostCode": cPostCode,
        "cCity": cCity,
        "cStateCode": cStateCode,
        "cCountryCode": cCountryCode,
        "cContactNo": cContactNo,
        "cEmailAddress": cEmailAddress,
        "cEmerContactName": cEmerContactName,
        "cEmerContactRel": cEmerContactRel,
        "cEmerContactNo": cEmerContactNo,
        "cMedicalCondition": cMedicalCondition,
        "cReceiverName": cReceiverName,
        "cReceiverContactNo": cReceiverContactNo,
        "cDeliveryCompanyName": cDeliveryCompanyName,
        "cDeliveryAddress1": cDeliveryAddress1,
        "cDeliveryAddress2": cDeliveryAddress2,
        "cDeliveryAddress3": cDeliveryAddress3,
        "cDeliveryPostCode": cDeliveryPostCode,
        "cDeliveryCity": cDeliveryCity,
        "cDeliveryStateCode": cDeliveryStateCode,
        "cDeliveryCountryCode": cDeliveryCountryCode,
        "profileDependentClasses": profileDependentClasses
      };
}

class Dependant {
  // int IID;
  String lProfileID;
  String cName;
  String cFirstName;
  String cLastName;
  String cNationality;
  String cIDNo;
  String? dDOB;
  String? cGender;
  String? cAddress1;
  String? cAddress2;
  String? cAddress3;
  String? cPostCode;
  String? cCity;
  String? cStateCode;
  String? cCountryCode;
  String? cContactNo;
  String? cEmailAddress;
  String? cEmerContactName;
  String? cEmerContactRel;
  String? cEmerContactNo;
  String? cMedicalCondition;
  String? cReceiverName;
  String? cReceiverContactNo;
  String? cDeliveryCompanyName;
  String? cDeliveryAddress1;
  String? cDeliveryAddress2;
  String? cDeliveryAddress3;
  String? cDeliveryPostCode;
  String? cDeliveryCity;
  String? cDeliveryStateCode;
  String? cDeliveryCountryCode;

  Dependant({
    // required this.lID,
    required this.lProfileID,
    required this.cName,
    required this.cFirstName,
    required this.cLastName,
    required this.cNationality,
    required this.cIDNo,
    this.dDOB,
    this.cGender,
    this.cAddress1,
    this.cAddress2,
    this.cAddress3,
    this.cPostCode,
    this.cCity,
    this.cStateCode,
    this.cCountryCode,
    this.cContactNo,
    this.cEmailAddress,
    this.cEmerContactName,
    this.cEmerContactRel,
    this.cEmerContactNo,
    this.cMedicalCondition,
    this.cReceiverName,
    this.cReceiverContactNo,
    this.cDeliveryCompanyName,
    this.cDeliveryAddress1,
    this.cDeliveryAddress2,
    this.cDeliveryAddress3,
    this.cDeliveryPostCode,
    this.cDeliveryCity,
    this.cDeliveryStateCode,
    this.cDeliveryCountryCode,
  });

  factory Dependant.fromJson(Map<String, dynamic> json) => Dependant(
        // lID: json["lID"],
        lProfileID: '{$json["lProfileID"]}',
        cName: json["cName"] ?? '',
        cIDNo: json["cIDNo"] ?? '',
        cFirstName: json["cFirstName"] ?? '',
        cLastName: json["cLastName"] ?? '',
        cNationality: json["cNationality"] ?? '',
        dDOB: json["dDOB"] ?? '',
        cGender: json["cGender"] ?? '',
        cAddress1: json["cAddress1"] ?? '',
        cAddress2: json["cAddress2"] ?? '',
        cAddress3: json["cAddress3"] ?? '',
        cPostCode: json["cPostCode"] ?? '',
        cCity: json["cCity"] ?? '',
        cStateCode: json["cStateCode"] ?? '',
        cCountryCode: json["cCoutryCode"] ?? '',
        cContactNo: json["cContactNo"] ?? '',
        cEmailAddress: json["cEmailAddress"] ?? '',
        cEmerContactName: json["cEmerContactName"] ?? '',
        cEmerContactRel: json["cEmerContactRel"] ?? '',
        cEmerContactNo: json["cEmerContactNo"] ?? '',
        cMedicalCondition: json["cMedicalCondition"] ?? '',
        cReceiverName: json["cReceiverName"] ?? '',
        cReceiverContactNo: json["cReceiverContactNo"] ?? '',
        cDeliveryCompanyName: json["cDeliveryCompanyName"] ?? '',
        cDeliveryAddress1: json["cDeliveryAddress1"] ?? '',
        cDeliveryAddress2: json["cDeliveryAddress2"] ?? '',
        cDeliveryAddress3: json["cDeliveryAddress3"] ?? '',
        cDeliveryPostCode: json["cDeliveryPostCode"] ?? '',
        cDeliveryCity: json["cDeliveryCity"] ?? '',
        cDeliveryStateCode: json["cDeliveryStateCode"] ?? '',
        cDeliveryCountryCode: json["cDeliveryCountryCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        // lID: json["lID"],
        "lProfileID": lProfileID,
        "cName": cName,
        "IDNo": cIDNo,
        "cFirstName": cFirstName,
        "cLastName": cLastName,
        "cNationality": cNationality,
        "dDOB": dDOB,
        "cGender": cGender,
        "cAddress1": cAddress1,
        "cAddress2": cAddress2,
        "cAddress3": cAddress3,
        "cPostCode": cPostCode,
        "cCity": cCity,
        "cStateCode": cStateCode,
        "cCountryCode": cCountryCode,
        "cContactNo": cContactNo,
        "cEmailAddress": cEmailAddress,
        "cEmerContactName": cEmerContactName,
        "cEmerContactRel": cEmerContactRel,
        "cEmerContactNo": cEmerContactNo,
        "cMedicalCondition": cMedicalCondition,
        "cReceiverName": cReceiverName,
        "cReceiverContactNo": cReceiverContactNo,
        "cDeliveryCompanyName": cDeliveryCompanyName,
        "cDeliveryAddress1": cDeliveryAddress1,
        "cDeliveryAddress2": cDeliveryAddress2,
        "cDeliveryAddress3": cDeliveryAddress3,
        "cDeliveryPostCode": cDeliveryPostCode,
        "cDeliveryCity": cDeliveryCity,
        "cDeliveryStateCode": cDeliveryStateCode,
        "cDeliveryCountryCode": cDeliveryCountryCode,
      };
}
