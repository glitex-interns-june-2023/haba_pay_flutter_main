import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) => SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  String phoneNumber;
  String email;

  SendOtpModel({
    required this.phoneNumber,
    required this.email,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
    phoneNumber: json["phone_number"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "email": email,
  };
}