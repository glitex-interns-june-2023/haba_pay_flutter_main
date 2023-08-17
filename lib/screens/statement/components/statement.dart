import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      appBar: AppBar(
        title: const Text("Statement"),
      ),
      backgroundColor: theme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        statementController.onAllClicked();
                      },
                      child: const Text("All")),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        statementController.onSentClicked();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/send.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Send")
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        statementController.onWithdrawClicked();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/withdraw.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Withdraw")
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        statementController.onDepositClicked();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/deposit.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Deposit")
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomScrollView(
                      slivers: [
                        Obx(() => SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final transaction =
                                    statementController.updatedList[index];
                                return Column(
                                  children: [
                                    Text(transaction.date),
                                    const Divider(),
                                    for (var statement
                                        in transaction.statementList)
                                      SingleStatement(
                                          type: statement.type,
                                          onClick: () {},
                                          name: statement.name,
                                          phoneNumber: statement.phoneNumber,
                                          amount: statement.amount,
                                          time: statement.time),
                                  ],
                                );
                              },
                              childCount:
                                  statementController.updatedList.length,
                            )))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
