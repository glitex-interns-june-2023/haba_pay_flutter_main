import 'dart:convert';

SendMoneyModel sendMoneyModelFromJson(String str) => SendMoneyModel.fromJson(json.decode(str));

String sendMoneyModelToJson(SendMoneyModel data) => json.encode(data.toJson());

class SendMoneyModel {
  String senderPhone;
  String receiverPhone;
  String amount;

  SendMoneyModel({
    required this.senderPhone,
    required this.receiverPhone,
    required this.amount,
  });

  factory SendMoneyModel.fromJson(Map<String, dynamic> json) => SendMoneyModel(
    senderPhone: json["sender_phone"],
    receiverPhone: json["receiver_phone"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "sender_phone": senderPhone,
    "receiver_phone": receiverPhone,
    "amount": amount,
  };
}