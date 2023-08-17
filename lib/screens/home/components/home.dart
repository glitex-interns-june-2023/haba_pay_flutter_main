import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/model/StatementModel.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<StatementModel> list = [
      StatementModel("Jane Mukenya", 'assets/images/deposit.svg', "Ksh 400",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane jashas", 'assets/images/deposit.svg', "Ksh 7568",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane Mukenya", 'assets/images/send.svg', "Ksh 653",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("liadhjld Mukenya", 'assets/images/deposit.svg',
          "Ksh 4535", "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane dhladk", 'assets/images/withdraw.svg', "Ksh 5667",
          "+254 787 787 879", "12:45 pm"),
    ];

    return Scaffold(
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
                                color: Colors.white,
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
                                        onPressed: () {},
                                        color: Colors.white,
                                        child: SvgPicture.asset(
                                            'assets/images/send.svg'),
                                      ),
                                      const Text(
                                        "Send",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.orange),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {},
                                        color: Colors.white,
                                        child: SvgPicture.asset(
                                            'assets/images/withdraw.svg'),
                                      ),
                                      const Text(
                                        "Withdraw",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.orange),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {},
                                        color: Colors.white,
                                        child: SvgPicture.asset(
                                          'assets/images/deposit.svg',
                                          color: Colors.orange,
                                        ),
                                      ),
                                      const Text(
                                        "Deposit",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.orange),
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
                                  color: CustomTheme().linear,
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
                                        const Text(
                                          "Account balance",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "KSH 90,000",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
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
                                        const Row(
                                          children: [
                                            Text(
                                              "+254 789 787",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Haba pay",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
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
                      child: SizedBox(
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Transactions",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "More",
                                      style: TextStyle(
                                          color: Colors.orange, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: list.length,
                                      itemBuilder: (context, index) {
                                        return SingleStatement(
                                            type: list[index].type,
                                            onClick: () {},
                                            name: list[index].name,
                                            phoneNumber:
                                                list[index].phoneNumber,
                                            amount: list[index].amount,
                                            time: list[index].time);
                                      }))
                            ],
                          ),
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
