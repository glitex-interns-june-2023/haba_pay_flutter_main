import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';

import '../../../model/MoneyModel.dart';
import 'deposit_confirm_details.dart';

final TextEditingController _amountController = TextEditingController();
final CustomTheme theme = CustomTheme();
class DepositDetails extends StatelessWidget {
  const DepositDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Deposit money"),
      body: LayoutBuilder(
        builder: (context, constraint){
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
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Balance",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: theme.grey
                                  ),
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
                          const SizedBox(height: 20,),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "From",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                                  "To HabaPay",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "234586785",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Amount",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            controller: _amountController,
                          ),
                          const Spacer(),
                          MaterialButton(
                              onPressed: () {
                                Get.to(()=> const DepositConfirmDetails(),
                                    transition: Transition.rightToLeft,
                                    arguments: MoneyModel(
                                        phoneNumber: "0789654575",
                                        recipient: "Jane Makena",
                                        amount : _amountController.text,
                                        newBalance: "800",
                                        payBillNumber: "1234567 habapay"
                                    )
                                );
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
                          const SizedBox(height: 20,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Deposit from ",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                              InkWell(
                                onTap: (){ Get.back(); },
                                child: Text(
                                  "new number",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: theme.orange
                                  ),
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
