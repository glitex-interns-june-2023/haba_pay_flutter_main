import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_confirm_details.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_money.dart';
import 'package:haba_pay_main/screens/withdraw_money/controller/WithdrawMoneyController.dart';

import '../../../model/MoneyModel.dart';
import '../../Shared/balance.dart';

final CustomTheme theme = CustomTheme();
final TextEditingController _amountController = TextEditingController();
final WithdrawMoneyController withdrawMoneyController =
    Get.put(WithdrawMoneyController());

class WithdrawTo extends StatelessWidget {
  const WithdrawTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Withdraw money"),
      body: LayoutBuilder(
        builder: (context, constraint) {
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
                          Obx(
                            () => Balance(
                                balance: withdrawMoneyController
                                    .accountBalance.value,
                                isVisibilityOn: withdrawMoneyController
                                    .isVisibilityOn.value,
                                onVisibilityChanged: () {
                                  withdrawMoneyController.onVisibilityChanged();
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Withdraw to",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "From",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "+254 789 895 458",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: theme.orange)),
                            ),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.number,
                            controller: _amountController,
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                              onPressed: () {
                                Get.to(() => const WithdrawConfirmDetails(),
                                    transition: Transition.rightToLeft,
                                    arguments: MoneyModel(
                                        phoneNumber: "0768823983",
                                        recipient: "Jane Makena",
                                        amount: _amountController.text,
                                        newBalance: "800"));
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: theme.orange,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/mpesa.svg',
                                    width: 40,
                                  ),
                                  Text(
                                    " Deposit from mpesa",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: theme.white,
                                        fontSize: 20),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Deposit from ",
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () => const WithdrawMoney(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Text(
                                  "new number",
                                  style: TextStyle(
                                      fontSize: 18, color: theme.orange),
                                ),
                              )
                            ],
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
        },
      ),
    );
  }
}
