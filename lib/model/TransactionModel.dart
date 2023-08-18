import 'StatementModel.dart';

class TransactionModel{
  int id;
  String date;
  List<StatementModel> statementList;

  TransactionModel(
      this.id,
      this.date,
      this.statementList );
}