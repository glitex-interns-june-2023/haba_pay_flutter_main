import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/controller/deposit_money_controller.dart';
import '../../Shared/balance.dart';

final DepositMoneyController depositMoneyController = Get.put(DepositMoneyController());
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
                                errorText: depositMoneyController.phoneNumberError.isNotEmpty
                                    ? depositMoneyController.phoneNumberError.value
                                    : null
                            ),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.phone,
                            controller: depositMoneyController.phoneNumberController,
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
                                errorText: depositMoneyController.amountError.isNotEmpty
                                    ? depositMoneyController.amountError.value
                                    : null
                            ),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.number,
                            controller: depositMoneyController.amountController,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const SizedBox(height: 20,),
                          MaterialButton(
                              onPressed: () {
                                depositMoneyController.proceedWithNumber();
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
                                  depositMoneyController.useMyNumber();
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
