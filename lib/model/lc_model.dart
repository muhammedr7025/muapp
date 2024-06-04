// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ICModel iCModelFromJson(String str) => ICModel.fromJson(json.decode(str));

String iCModelToJson(ICModel data) => json.encode(data.toJson());

class ICModel {
  bool hasError;
  int statusCode;
  Message message;
  Response response;

  ICModel({
    required this.hasError,
    required this.statusCode,
    required this.message,
    required this.response,
  });

  factory ICModel.fromJson(Map<String, dynamic> json) => ICModel(
        hasError: json["hasError"],
        statusCode: json["statusCode"],
        message: Message.fromJson(json["message"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "hasError": hasError,
        "statusCode": statusCode,
        "message": message.toJson(),
        "response": response.toJson(),
      };
}

class Message {
  List<dynamic> general;

  Message({
    required this.general,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        general: List<dynamic>.from(json["general"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "general": List<dynamic>.from(general.map((x) => x)),
      };
}

class Response {
  List<Datum> data;
  Pagination pagination;

  Response({
    required this.data,
    required this.pagination,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Datum {
  String id;
  String name;
  IgName igName;
  String orgName;
  int memberCount;
  dynamic members;
  String? meetPlace;
  String? meetTime;
  String leadName;
  int karma;

  Datum({
    required this.id,
    required this.name,
    required this.igName,
    required this.orgName,
    required this.memberCount,
    required this.members,
    required this.meetPlace,
    required this.meetTime,
    required this.leadName,
    required this.karma,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        igName: igNameValues.map[json["ig_name"]]!,
        orgName: json["org_name"],
        memberCount: json["member_count"],
        members: json["members"],
        meetPlace: json["meet_place"],
        meetTime: json["meet_time"],
        leadName: json["lead_name"],
        karma: json["karma"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ig_name": igNameValues.reverse[igName],
        "org_name": orgName,
        "member_count": memberCount,
        "members": members,
        "meet_place": meetPlace,
        "meet_time": meetTime,
        "lead_name": leadName,
        "karma": karma,
      };
}

enum IgName { WEB_DEVELOPMENT }

final igNameValues = EnumValues({"Web Development": IgName.WEB_DEVELOPMENT});

class Pagination {
  int count;
  int totalPages;
  bool isNext;
  bool isPrev;
  int nextPage;

  Pagination({
    required this.count,
    required this.totalPages,
    required this.isNext,
    required this.isPrev,
    required this.nextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        totalPages: json["totalPages"],
        isNext: json["isNext"],
        isPrev: json["isPrev"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "totalPages": totalPages,
        "isNext": isNext,
        "isPrev": isPrev,
        "nextPage": nextPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
