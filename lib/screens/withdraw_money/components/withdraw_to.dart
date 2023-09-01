import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/withdraw_money/controller/WithdrawMoneyController.dart';
import '../../Shared/balance.dart';

final CustomTheme theme = CustomTheme();
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
                                  "Phone",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Obx(() => Text(
                                    withdrawMoneyController
                                        .withdrawToPhoneNumber.value,
                                    style: const TextStyle(fontSize: 18),
                                  )),
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
                                          .withdrawToAmountError.isNotEmpty
                                      ? withdrawMoneyController
                                          .withdrawToAmountError.value
                                      : null),
                              cursorColor: theme.orange,
                              keyboardType: TextInputType.number,
                              controller: withdrawMoneyController
                                  .withdrawToAmountController,
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() => CustomButton(
                              isLoading:
                                  withdrawMoneyController.isLoading.value,
                              isSvgVector: true,
                              svgVector: "assets/images/mpesa.svg",
                              title: " Withdraw to mpesa",
                              onClick: () {
                                withdrawMoneyController
                                    .onWithdrawToMpesaClicked();
                              })),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Withdraw to ",
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  withdrawMoneyController.onNewNumberClicked();
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
