import 'dart:convert';

ConfirmSendDetailsResponseModel confirmSendDetailsResponseModelFromJson(String str) => ConfirmSendDetailsResponseModel.fromJson(json.decode(str));

String confirmSendDetailsResponseModelToJson(ConfirmSendDetailsResponseModel data) => json.encode(data.toJson());

class ConfirmSendDetailsResponseModel {
  bool success;
  Data data;

  ConfirmSendDetailsResponseModel({
    required this.success,
    required this.data,
  });

  factory ConfirmSendDetailsResponseModel.fromJson(Map<String, dynamic> json) => ConfirmSendDetailsResponseModel(
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