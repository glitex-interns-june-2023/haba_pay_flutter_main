// To parse this JSON data, do
//
//     final googleTokenModel = googleTokenModelFromJson(jsonString);

import 'dart:convert';

GoogleTokenModel googleTokenModelFromJson(String str) => GoogleTokenModel.fromJson(json.decode(str));

String googleTokenModelToJson(GoogleTokenModel data) => json.encode(data.toJson());

class GoogleTokenModel {
  String? token;

  GoogleTokenModel({
    required this.token,
  });

  factory GoogleTokenModel.fromJson(Map<String, dynamic> json) => GoogleTokenModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}