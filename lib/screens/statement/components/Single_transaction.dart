import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';

import '../../../model/StatementModel.dart';

class SingleTransaction extends StatefulWidget {
  final String date;
  final List<StatementModel> statementList;
  const SingleTransaction({
    super.key,
    required this.date,
    required this.statementList
  });

  @override
  State<SingleTransaction> createState() => _SingleTransactionState();
}

class _SingleTransactionState extends State<SingleTransaction> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.date,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.statementList.length,
                    itemBuilder: (context, index){
                      return SingleStatement(
                          icon: widget.statementList[index].icon,
                          onClick: (){},
                          name: widget.statementList[index].name,
                          phoneNumber: widget.statementList[index].phoneNumber,
                          amount: widget.statementList[index].amount,
                          time: widget.statementList[index].time
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
