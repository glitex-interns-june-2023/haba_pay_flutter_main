import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/model/StatementModel.dart';
import 'package:haba_pay_main/model/TransactionModel.dart';
import 'package:haba_pay_main/screens/statement/components/Single_transaction.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';
import 'package:haba_pay_main/screens/statement/controller/statement_controller.dart';
import 'package:get/get.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  final CustomTheme theme = CustomTheme();
  List<TransactionModel> list = [
    TransactionModel("2 February 2023", [
      StatementModel("Jane Mukenya", 'assets/images/deposit.svg', "Ksh 400",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane jashas", 'assets/images/deposit.svg', "Ksh 7568",
          "+254 787 787 879", "12:45 pm")
    ]),
    TransactionModel("1 February 2023", [
      StatementModel("Jane Mukenya", 'assets/images/send.svg', "Ksh 653",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("liadhjld Mukenya", 'assets/images/deposit.svg',
          "Ksh 4535", "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane dhladk", 'assets/images/withdraw.svg', "Ksh 5667",
          "+254 787 787 879", "12:45 pm"),
    ])
  ];
  final StatementController statementController =
      Get.put(StatementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      body: Column(
        children: [
          Row(
            children: [
              MaterialButton(onPressed: () {}),
              MaterialButton(onPressed: () {}),
              MaterialButton(onPressed: () {}),
              MaterialButton(onPressed: () {}),
            ],
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CustomScrollView(
                  slivers: [
                    Obx(() => SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final transaction = list[index];
                            return Column(
                              children: [
                                Text(transaction.date),
                                const Divider(),
                                for (var statement in transaction.statementList)
                                  SingleStatement(
                                      icon: statement.icon,
                                      onClick: () {},
                                      name: statement.name,
                                      phoneNumber: statement.phoneNumber,
                                      amount: statement.amount,
                                      time: statement.time
                                  ),
                              ],
                            );
                          },
                          childCount: list.length,
                        ))
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
