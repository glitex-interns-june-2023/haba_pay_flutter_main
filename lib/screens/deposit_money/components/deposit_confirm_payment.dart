import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_verify_transaction.dart';
import 'package:get/get.dart';

final TextEditingController _passwordController = TextEditingController();
final CustomTheme theme = CustomTheme();

class DepositConfirmPayment extends StatelessWidget {
  const DepositConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Confirm deposit"),
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
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "New Balance",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                )),
                          ),
                          const Row(
                            children: [
                              Text(
                                "Ksh 850",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                child: Icon(Icons.visibility_off),
                              )
                            ],
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
                                  "Phone",
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
                                  "Paybill number",
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
                                  "2345678 - Habapay",
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
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Ksh. 400",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            controller: _passwordController,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: theme.orange),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: theme.orange),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.to(
                                      () => const DepositVerifyTransaction(),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  height: 50,
                                  color: theme.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: theme.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
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
