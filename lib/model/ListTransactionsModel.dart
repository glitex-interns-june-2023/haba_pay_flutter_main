// To parse this JSON data, do
//
//     final listTransactionsModel = listTransactionsModelFromJson(jsonString);

import 'dart:convert';

ListTransactionsModel listTransactionsModelFromJson(String str) => ListTransactionsModel.fromJson(json.decode(str));

String listTransactionsModelToJson(ListTransactionsModel data) => json.encode(data.toJson());

class ListTransactionsModel {
  bool success;
  Data data;

  ListTransactionsModel({
    required this.success,
    required this.data,
  });

  factory ListTransactionsModel.fromJson(Map<String, dynamic> json) => ListTransactionsModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  int page;
  int total;
  int perPage;
  dynamic previousPage;
  int nextPage;
  int lastPage;
  List<Datum> data;

  Data({
    required this.page,
    required this.total,
    required this.perPage,
    required this.previousPage,
    required this.nextPage,
    required this.lastPage,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    total: json["total"],
    perPage: json["per_page"],
    previousPage: json["previous_page"],
    nextPage: json["next_page"],
    lastPage: json["last_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total": total,
    "per_page": perPage,
    "previous_page": previousPage,
    "next_page": nextPage,
    "last_page": lastPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String date;
  List<Transaction> transactions;

  Datum({
    required this.date,
    required this.transactions,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: json["date"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  String transactionId;
  String fullName;
  String phone;
  String currency;
  double amount;
  String type;
  String timestamp;

  Transaction({
    required this.transactionId,
    required this.fullName,
    required this.phone,
    required this.currency,
    required this.amount,
    required this.type,
    required this.timestamp,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"],
    fullName: json["full_name"],
    phone: json["phone"],
    currency: json["currency"],
    amount: json["amount"]?.toDouble(),
    type: json["type"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "full_name": fullName,
    "phone": phone,
    "currency": currency,
    "amount": amount,
    "type": type,
    "timestamp": timestamp,
  };
}
