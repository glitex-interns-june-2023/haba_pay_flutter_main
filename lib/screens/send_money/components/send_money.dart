import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/model/MoneyModel.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/Shared/balance.dart';
import 'package:haba_pay_main/screens/send_money/components/confirm_details.dart';
import 'package:haba_pay_main/screens/send_money/controller/send_money_controller.dart';

final TextEditingController _phoneNumberController = TextEditingController();
final SendMoneyController sendMoneyController = Get.put(SendMoneyController());
final TextEditingController _amountController = TextEditingController();
final CustomTheme theme = CustomTheme();

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Send money"),
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
                          Obx(() => Balance(
                              balance: sendMoneyController.accountBalance.value,
                              isVisibilityOn: sendMoneyController.isVisibilityOn.value,
                              onVisibilityChanged: (){ sendMoneyController.onVisibilityChanged(); }
                          ),),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Send to",
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
                            decoration:  InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.orange
                                  )
                              ),
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
                            decoration:  InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.orange
                                  )
                              ),
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
                                Get.to(() => const ConfirmDetails(),
                                    transition: Transition.rightToLeft,
                                    arguments: MoneyModel(
                                        phoneNumber:
                                            _phoneNumberController.text,
                                        recipient: "Jane Makena",
                                        amount: _amountController.text,
                                        newBalance: "800"));
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: theme.orange,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  "send",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.white,
                                      fontSize: 20),
                                ),
                              )),
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
