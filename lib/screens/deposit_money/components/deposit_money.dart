import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_details.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_details.dart';
import 'package:haba_pay_main/screens/deposit_money/controller/deposit_money_controller.dart';

import '../../../model/MoneyModel.dart';
import '../../Shared/balance.dart';

final TextEditingController _phoneNumberController = TextEditingController();
final DepositMoneyController depositMoneyController = Get.put(DepositMoneyController());
final TextEditingController _amountController = TextEditingController();
final CustomTheme theme = CustomTheme();

class DepositMoney extends StatelessWidget {
  const DepositMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.background,
        appBar: const CustomAppBar(title: "Deposit money"),
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
                                balance: depositMoneyController
                                    .accountBalance.value,
                                isVisibilityOn: depositMoneyController
                                    .isVisibilityOn.value,
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
                            "Deposit from",
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
                          TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: theme.orange)),
                            ),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumberController,
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
                          const Spacer(
                            flex: 2,
                          ),
                          const SizedBox(height: 20,),
                          MaterialButton(
                              onPressed: () {
                                Get.to(() => const DepositConfirmDetails(),
                                    transition: Transition.rightToLeft,
                                    arguments: MoneyModel(
                                        phoneNumber:
                                            _phoneNumberController.text,
                                        recipient: "Jane Makena",
                                        amount: _amountController.text,
                                        newBalance: "800",
                                        payBillNumber: "12344 Habapay"));
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: theme.orange,
                              child: Text(
                                "Proceed with number",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.white,
                                    fontSize: 18),
                              )),
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
                                  Get.to(
                                    () => const DepositDetails(),
                                    transition: Transition.rightToLeft,
                                  );
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
