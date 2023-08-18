import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/withdraw_money/controller/WithdrawMoneyController.dart';

final WithdrawMoneyController withdrawMoneyController =
    Get.put(WithdrawMoneyController());
final CustomTheme theme = CustomTheme();

class WithdrawVerifyingTransaction extends StatelessWidget {
  const WithdrawVerifyingTransaction({super.key});

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
                            if (withdrawMoneyController.isLoading.value)
                              const Text(
                                "Verifying transaction",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else if (withdrawMoneyController.isSuccessful.value)
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
                            if (withdrawMoneyController.isLoading.value)
                              CircularProgressIndicator(color: theme.orange)
                            else if (withdrawMoneyController.isSuccessful.value)
                              const Image(
                                  image: AssetImage(
                                      'assets/images/smile_face.png'))
                            else
                              const Image(
                                  image:
                                      AssetImage('assets/images/sad_face.png')),
                            const Spacer(),
                            if (withdrawMoneyController.isLoading.value)
                              const Text(
                                "Your wallet's balance will be \n updated in 30",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              )
                            else if (withdrawMoneyController.isSuccessful.value)
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
                            if (!withdrawMoneyController.isSuccessful.value)
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: theme.orange),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            "Call support",
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
                                        withdrawMoneyController
                                            .verifyTransaction();
                                      },
                                      height: 50,
                                      color: theme.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Retry",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: theme.white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              MaterialButton(
                                  onPressed: () {
                                    withdrawMoneyController.verifyTransaction();
                                  },
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: theme.orange,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: Text(
                                      "Return to Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: theme.white,
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
