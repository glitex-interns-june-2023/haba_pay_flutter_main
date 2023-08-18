import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/model/MoneyModel.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_identity.dart';

final CustomTheme theme = CustomTheme();

class DepositConfirmDetails extends StatelessWidget {
  const DepositConfirmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final depositMoneyModel = Get.arguments as MoneyModel;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Confirm details"),
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "New Balance",
                                  style: TextStyle(
                                      color: theme.grey, fontSize: 18),
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                depositMoneyModel.newBalance,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const Spacer(),
                              const InkWell(
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  depositMoneyModel.phoneNumber,
                                  style: const TextStyle(fontSize: 18),
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  depositMoneyModel.payBillNumber!,
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  depositMoneyModel.amount,
                                  style: const TextStyle(fontSize: 18),
                                )),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
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
                                      () => const DepositConfirmIdentity(),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  height: 50,
                                  color: theme.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "send",
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
