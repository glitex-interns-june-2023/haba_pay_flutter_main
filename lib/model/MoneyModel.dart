class MoneyModel {
  String phoneNumber;
  String recipient;
  String amount;
  String newBalance;
  String? payBillNumber;

  MoneyModel(
      {required this.phoneNumber,
      required this.recipient,
      required this.amount,
      required this.newBalance,
      this.payBillNumber});
}
