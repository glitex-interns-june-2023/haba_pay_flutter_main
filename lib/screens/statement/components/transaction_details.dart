import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

import '../../../model/StatementModel.dart';

final CustomTheme theme = CustomTheme();

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final statement = arguments['statement'] as StatementModel;
    final date = arguments['date'] as String;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Transaction details"),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Transaction Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (statement.type == "send")
                              SvgPicture.asset(
                                'assets/images/send.svg',
                                color: theme.black,
                              )
                            else if (statement.type == "deposit")
                              SvgPicture.asset(
                                'assets/images/deposit.svg',
                                color: theme.black,
                              )
                            else
                              SvgPicture.asset(
                                'assets/images/withdraw.svg',
                                color: theme.black,
                              ),
                            if (statement.type == "send")
                              const Text(
                                "  Send",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else if (statement.type == "deposit")
                              const Text(
                                "  Deposit",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else
                              const Text(
                                "  Withdraw",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                          ],
                        ),
                        const Spacer(),
                        const Divider(),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Phone",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                statement.phoneNumber,
                                style: const TextStyle(fontSize: 18),
                              )),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Recipient",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                statement.name,
                                style: const TextStyle(fontSize: 18),
                              )),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                statement.amount as String,
                                style: const TextStyle(fontSize: 18),
                              )),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Transaction ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "BN127613897",
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                        const Spacer(),
                        const Divider(),
                        const Spacer(),
                        Text(
                          "$date ${statement.time}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
