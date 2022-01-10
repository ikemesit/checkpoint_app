// To parse this JSON data, do
//
//     final checkpointEvent = checkpointEventFromJson(jsonString);

import 'dart:convert';

List<CheckpointEvent> eventFromJson(String str) => List<CheckpointEvent>.from(
    json.decode(str).map((x) => CheckpointEvent.fromJson(x)));

String eventToJson(List<CheckpointEvent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckpointEvent {
  CheckpointEvent({
    required this.cCode,
    required this.cShortName,
    required this.cDescription,
    required this.dDateTimeFrom,
    required this.dDateTimeTo,
    required this.cVenue,
    required this.cStateDesc,
    required this.cCountryDesc,
    required this.cImageUrl,
    required this.cEventDetailUrl,
    required this.cEventRegistrationUrl,
    this.cRedirectUrl,
    required this.dOpeningDateTime,
    required this.dClosingDateTime,
  });

  String cCode;
  String cShortName;
  String cDescription;
  DateTime dDateTimeFrom;
  DateTime dDateTimeTo;
  String cVenue;
  String cStateDesc;
  String cCountryDesc;
  String cImageUrl;
  String cEventDetailUrl;
  String cEventRegistrationUrl;
  dynamic cRedirectUrl;
  DateTime dOpeningDateTime;
  DateTime dClosingDateTime;

  factory CheckpointEvent.fromJson(Map<String, dynamic> json) =>
      CheckpointEvent(
        cCode: json["cCode"] ?? 'test',
        cShortName: json["cShortName"] ?? 'test',
        cDescription: json["cDescription"] ?? 'test',
        dDateTimeFrom: DateTime.parse(json["dDateTimeFrom"]),
        dDateTimeTo: json["dDateTimeTo"] == null
            ? DateTime.now()
            : DateTime.parse(json["dDateTimeTo"]),
        cVenue: json["cVenue"],
        cStateDesc: json["cStateDesc"],
        cCountryDesc: json["cCountryDesc"],
        cImageUrl: json["cImageURL"],
        cEventDetailUrl: json["cEventDetailURL"],
        cEventRegistrationUrl: json["cEventRegistrationURL"],
        cRedirectUrl: json["cRedirectURL"],
        dOpeningDateTime: DateTime.parse(json["dOpeningDateTime"]),
        dClosingDateTime: DateTime.parse(json["dClosingDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "cCode": cCode,
        "cShortName": cShortName,
        "cDescription": cDescription,
        "dDateTimeFrom": dDateTimeFrom.toIso8601String(),
        "dDateTimeTo": dDateTimeTo.toIso8601String(),
        "cVenue": cVenue,
        "cStateDesc": cStateDesc,
        "cCountryDesc": cCountryDesc,
        "cImageURL": cImageUrl,
        "cEventDetailURL": cEventDetailUrl,
        "cEventRegistrationURL": cEventRegistrationUrl,
        "cRedirectURL": cRedirectUrl,
        "dOpeningDateTime": dOpeningDateTime.toIso8601String(),
        "dClosingDateTime": dClosingDateTime.toIso8601String(),
      };
}
