import 'StatementModel.dart';

class TransactionModel{
  String date;
  List<StatementModel> statementList;

  TransactionModel(
      this.date,
      this.statementList );
}