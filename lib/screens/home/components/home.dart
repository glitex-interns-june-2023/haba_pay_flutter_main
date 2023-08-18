import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_money.dart';
import 'package:haba_pay_main/screens/home/controller/home_controller.dart';
import 'package:haba_pay_main/screens/send_money/components/send_money.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_money.dart';

final HomeController homeController = Get.put(HomeController());
final CustomTheme theme = CustomTheme();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.white,
        leading: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'assets/images/bell.svg',
              color: theme.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: theme.background,
              child: Text(
                "BN",
                style: TextStyle(color: theme.black),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: CustomTheme().background,
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: theme.white,
                                borderRadius: BorderRadius.circular(5)),
                            height: 200,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Get.to(()=> const SendMoney(), transition: Transition.rightToLeft);
                                        },
                                        color: theme.white,
                                        child: SvgPicture.asset(
                                            'assets/images/send.svg'),
                                      ),
                                      Text(
                                        "Send",
                                        style: TextStyle(
                                            fontSize: 14, color: theme.orange),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Get.to(()=> const WithdrawMoney(), transition: Transition.rightToLeft);
                                        },
                                        color: theme.white,
                                        child: SvgPicture.asset(
                                            'assets/images/withdraw.svg'),
                                      ),
                                      Text(
                                        "Withdraw",
                                        style: TextStyle(
                                            fontSize: 14, color: theme.orange),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Get.to(()=> const DepositMoney(), transition: Transition.rightToLeft);
                                        },
                                        color: theme.white,
                                        child: SvgPicture.asset(
                                          'assets/images/deposit.svg',
                                          color: theme.orange,
                                        ),
                                      ),
                                      Text(
                                        "Deposit",
                                        style: TextStyle(
                                            fontSize: 14, color: theme.orange),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: theme.linear,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Account balance",
                                          style: TextStyle(
                                              fontSize: 12, color: theme.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "KSH 90,000",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: theme.white),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                  'assets/images/visibility_off.svg'),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "+254 789 787",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: theme.grey),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "Haba pay",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: theme.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset('assets/images/Frame.svg')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Transactions",
                                  style: TextStyle(
                                      fontSize: 18, color: theme.grey),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "More",
                                    style: TextStyle(
                                        color: theme.orange, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            Obx(() => Column(
                                  children: [
                                    for (var statement in homeController.list)
                                      SingleStatement(
                                          type: statement.type,
                                          onClick: () {},
                                          name: statement.name,
                                          phoneNumber: statement.phoneNumber,
                                          amount: statement.amount,
                                          time: statement.time)
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
