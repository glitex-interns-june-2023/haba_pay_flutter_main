import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/controller/deposit_money_controller.dart';

import '../../../model/MoneyModel.dart';
import '../../Shared/balance.dart';
import 'deposit_confirm_details.dart';

final TextEditingController _amountController = TextEditingController();
final CustomTheme theme = CustomTheme();
final DepositMoneyController depositMoneyController =
    Get.put(DepositMoneyController());

class DepositDetails extends StatelessWidget {
  const DepositDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Deposit money"),
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
                                balance:
                                    depositMoneyController.accountBalance.value,
                                isVisibilityOn:
                                    depositMoneyController.isVisibilityOn.value,
                                onVisibilityChanged: () {
                                  depositMoneyController.onVisibilityChanged();
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
                            "Confirm Details",
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  depositMoneyController.number.value,
                                  style: const TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "To HabaPay",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  depositMoneyController.habaPay.value,
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
                                Get.to(() => const DepositConfirmDetails(),
                                    transition: Transition.rightToLeft,
                                    arguments: MoneyModel(
                                        phoneNumber:
                                            depositMoneyController.number.value,
                                        recipient: "Jane Makena",
                                        amount: _amountController.text,
                                        newBalance: "800",
                                        payBillNumber:
                                            "${depositMoneyController.habaPay.value} habapay"));
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
                                        fontSize: 18),
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
                                  Get.back();
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
