import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  String phoneNumber;
  String otp;

  VerifyOtpModel({
    required this.phoneNumber,
    required this.otp,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    phoneNumber: json["phone_number"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "otp": otp,
  };
}