import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/home/components/home.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';
import 'package:haba_pay_main/screens/statement/components/transaction_details.dart';
import 'package:haba_pay_main/screens/statement/controller/statement_controller.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();
final StatementController statementController = Get.put(StatementController());

class Statement extends StatelessWidget {
  const Statement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.white,
        title: Text(
          "Statement",
          style: TextStyle(color: theme.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                'assets/images/bell.svg',
                color: theme.black,
              ),
            ),
          ),
        ],
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
                      child: Text(
                        "All",
                        style: TextStyle(color: theme.orange),
                      )),
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
                          Text(
                            "Send",
                            style: TextStyle(color: theme.orange),
                          )
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
                          Text(
                            "Withdraw",
                            style: TextStyle(color: theme.orange),
                          )
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
                          SvgPicture.asset(
                            'assets/images/deposit.svg',
                            color: theme.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Deposit",
                            style: TextStyle(color: theme.orange),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Obx(() => Text(statementController.list.length.toString()))
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
