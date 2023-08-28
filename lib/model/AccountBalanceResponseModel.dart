import 'dart:convert';

AccountBalanceResponseModel accountBalanceResponseModelFromJson(String str) => AccountBalanceResponseModel.fromJson(json.decode(str));

String accountBalanceResponseModelToJson(AccountBalanceResponseModel data) => json.encode(data.toJson());

class AccountBalanceResponseModel {
  bool success;
  String message;
  Data data;

  AccountBalanceResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AccountBalanceResponseModel.fromJson(Map<String, dynamic> json) => AccountBalanceResponseModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String userId;
  String balance;
  String currency;
  String lastUpdate;

  Data({
    required this.userId,
    required this.balance,
    required this.currency,
    required this.lastUpdate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    balance: json["balance"],
    currency: json["currency"],
    lastUpdate: json["last_update"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "balance": balance,
    "currency": currency,
    "last_update": lastUpdate,
  };
}
