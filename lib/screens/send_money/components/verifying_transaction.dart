import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/home/components/home.dart';
import 'package:haba_pay_main/screens/send_money/controller/send_money_controller.dart';

final SendMoneyController sendMoneyController = Get.put(SendMoneyController());
final CustomTheme theme = CustomTheme();

class VerifyingTransaction extends StatelessWidget {
  const VerifyingTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Verifying transaction"),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Obx(
                        () => Column(
                          children: [
                            const Spacer(),
                            if (sendMoneyController.isLoading.value)
                              const Text(
                                "Verifying transaction",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            else if (sendMoneyController.isSuccessful.value)
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
                            if (sendMoneyController.isLoading.value)
                              CircularProgressIndicator(color: theme.orange)
                            else if (sendMoneyController.isSuccessful.value)
                              SvgPicture.asset(
                                'assets/images/smile_face.svg'
                              )
                            else
                              SvgPicture.asset(
                                  'assets/images/sad_face.svg'
                              ),
                            const Spacer(),
                            if (sendMoneyController.isLoading.value)
                              const Text(
                                "Your wallet's balance will be \n updated in 30",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              )
                            else if (sendMoneyController.isSuccessful.value)
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
                            const SizedBox(height: 20,),
                            if (!sendMoneyController.isSuccessful.value)
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
                                        sendMoneyController.verifyTransaction();
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
                                    Get.offAll(
                                          () => const Dashboard(),
                                      transition: Transition.rightToLeft,
                                    );
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
