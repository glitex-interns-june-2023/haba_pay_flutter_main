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
              OutlinedButton(onPressed: (){statementController.onAllClicked();}, child: const Text("All")),
              OutlinedButton(onPressed: (){statementController.onSentClicked();}, child: const Text("send")),
              OutlinedButton(onPressed: (){statementController.onWithdrawClicked();}, child: const Text("withdraw")),
              OutlinedButton(onPressed: (){statementController.onDepositClicked();}, child: const Text("deposit"))
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
                            final transaction = statementController.list[index];
                            return Column(
                              children: [
                                Text(transaction.date),
                                const Divider(),
                                for (var statement in transaction.statementList)
                                  SingleStatement(
                                      type: statement.type,
                                      onClick: () {},
                                      name: statement.name,
                                      phoneNumber: statement.phoneNumber,
                                      amount: statement.amount,
                                      time: statement.time
                                  ),
                              ],
                            );
                          },
                          childCount: statementController.list.length,
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
