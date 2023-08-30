import 'dart:convert';

DepositCashModel depositCashModelFromJson(String str) => DepositCashModel.fromJson(json.decode(str));

String depositCashModelToJson(DepositCashModel data) => json.encode(data.toJson());

class DepositCashModel {
  String senderPhone;
  String mpesaNumber;
  String amount;

  DepositCashModel({
    required this.senderPhone,
    required this.mpesaNumber,
    required this.amount,
  });

  factory DepositCashModel.fromJson(Map<String, dynamic> json) => DepositCashModel(
    senderPhone: json["sender_phone"],
    mpesaNumber: json["mpesa_number"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "sender_phone": senderPhone,
    "mpesa_number": mpesaNumber,
    "amount": amount,
  };
}