
import 'dart:convert';

AccountBalanceModel accountBalanceModelFromJson(String str) => AccountBalanceModel.fromJson(json.decode(str));

String accountBalanceModelToJson(AccountBalanceModel data) => json.encode(data.toJson());

class AccountBalanceModel {
  bool success;
  String? message;
  Data data;

  AccountBalanceModel({
    required this.success,
    this.message,
    required this.data,
  });

  factory AccountBalanceModel.fromJson(Map<String, dynamic> json) => AccountBalanceModel(
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
  int userId;
  dynamic balance;
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
