import 'dart:convert';

WithdrawCashModel withdrawCashModelFromJson(String str) => WithdrawCashModel.fromJson(json.decode(str));

String withdrawCashModelToJson(WithdrawCashModel data) => json.encode(data.toJson());

class WithdrawCashModel {
  String senderPhone;
  String receiverPhone;
  String amount;

  WithdrawCashModel({
    required this.senderPhone,
    required this.receiverPhone,
    required this.amount,
  });

  factory WithdrawCashModel.fromJson(Map<String, dynamic> json) => WithdrawCashModel(
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
