
import 'dart:convert';

ConfirmRecipientDetailsModel confirmRecipientDetailsModelFromJson(String str) => ConfirmRecipientDetailsModel.fromJson(json.decode(str));

String confirmRecipientDetailsModelToJson(ConfirmRecipientDetailsModel data) => json.encode(data.toJson());

class ConfirmRecipientDetailsModel {
  bool success;
  Data data;

  ConfirmRecipientDetailsModel({
    required this.success,
    required this.data,
  });

  factory ConfirmRecipientDetailsModel.fromJson(Map<String, dynamic> json) => ConfirmRecipientDetailsModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String phone;
  String fullName;

  Data({
    required this.phone,
    required this.fullName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    phone: json["phone"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "full_name": fullName,
  };
}
