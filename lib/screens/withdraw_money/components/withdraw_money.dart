import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/withdraw_money/controller/WithdrawMoneyController.dart';

import '../../Shared/balance.dart';

final WithdrawMoneyController withdrawMoneyController =
    Get.put(WithdrawMoneyController());
final CustomTheme theme = CustomTheme();

class WithdrawMoney extends StatelessWidget {
  const WithdrawMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.background,
        appBar: const CustomAppBar(title: "Withdraw money"),
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
                                  "Phone",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          Obx(
                            () => TextField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: theme.orange)),
                                  errorText: withdrawMoneyController
                                          .phoneNumberError.isNotEmpty
                                      ? withdrawMoneyController
                                          .phoneNumberError.value
                                      : null),
                              cursorColor: theme.orange,
                              keyboardType: TextInputType.phone,
                              controller:
                                  withdrawMoneyController.phoneNumberController,
                            ),
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
                          Obx(
                            () => TextField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: theme.orange)),
                                  errorText: withdrawMoneyController
                                          .amountError.isNotEmpty
                                      ? withdrawMoneyController
                                          .amountError.value
                                      : null),
                              cursorColor: theme.orange,
                              keyboardType: TextInputType.number,
                              controller:
                                  withdrawMoneyController.amountController,
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() => CustomButton(
                              isLoading: withdrawMoneyController.isLoading.value,
                              title: "Proceed with number",
                              onClick: () {
                                withdrawMoneyController
                                    .onProceedWithNumberClicked();
                              })),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Use ",
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  withdrawMoneyController.onUseNumber();
                                },
                                child: Text(
                                  "my number",
                                  style: TextStyle(
                                      color: theme.orange, fontSize: 18),
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
        }));
  }
}
