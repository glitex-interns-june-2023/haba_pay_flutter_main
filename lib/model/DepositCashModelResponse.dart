import 'dart:convert';

DepositCashResponseModel depositCashResponseModelFromJson(String str) => DepositCashResponseModel.fromJson(json.decode(str));

String depositCashResponseModelToJson(DepositCashResponseModel data) => json.encode(data.toJson());

class DepositCashResponseModel {
  bool success;
  String message;
  Data data;

  DepositCashResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DepositCashResponseModel.fromJson(Map<String, dynamic> json) => DepositCashResponseModel(
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
  String transactionId;
  String transactionMessage;
  String amount;
  String currency;
  String timestamp;
  String balance;

  Data({
    required this.transactionId,
    required this.transactionMessage,
    required this.amount,
    required this.currency,
    required this.timestamp,
    required this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    transactionId: json["transaction_id"],
    transactionMessage: json["transaction_message"],
    amount: json["amount"],
    currency: json["currency"],
    timestamp: json["timestamp"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "transaction_message": transactionMessage,
    "amount": amount,
    "currency": currency,
    "timestamp": timestamp,
    "balance": balance,
  };
}
