import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/controller/deposit_money_controller.dart';

class DepositVerifyTransaction extends StatefulWidget {
  const DepositVerifyTransaction({super.key});

  @override
  State<DepositVerifyTransaction> createState() =>
      _DepositVerifyTransactionState();
}

class _DepositVerifyTransactionState extends State<DepositVerifyTransaction> {
  final DepositMoneyController depositMoneyController =
      Get.put(DepositMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Obx(
                        () => Column(
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            if (depositMoneyController.isLoading.value)
                              const Text(
                                "Verifying transaction",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else if (depositMoneyController.isSuccessful.value)
                              const Text(
                                "Transaction Successful",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else
                              const Text(
                                "Transaction failed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            if (depositMoneyController.isLoading.value)
                              const CircularProgressIndicator(
                                  color: Colors.orange)
                            else if (depositMoneyController.isSuccessful.value)
                              const Image(
                                  image: AssetImage(
                                      'assets/images/smile_face.png'))
                            else
                              const Image(
                                  image:
                                      AssetImage('assets/images/sad_face.png')),
                            const Spacer(),
                            if (depositMoneyController.isLoading.value)
                              const Text(
                                "Your wallet's balance will be \n updated in 30",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              )
                            else if (depositMoneyController.isSuccessful.value)
                              const Text(
                                "We are happy for you. \n Your wallet's balance is updated",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              )
                            else
                              const Text(
                                "Something went wrong. \n The deposit was not successful",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            const Spacer(
                              flex: 4,
                            ),
                            if (!depositMoneyController.isSuccessful.value)
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            "Call support",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
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
                                        depositMoneyController
                                            .verifyTransaction();
                                      },
                                      height: 50,
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        "Retry",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              MaterialButton(
                                  onPressed: () {
                                    depositMoneyController.verifyTransaction();
                                  },
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: Colors.orange,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    child: Text(
                                      "Return to Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  )),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
