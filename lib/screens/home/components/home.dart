
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/model/StatementModel.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<StatementModel> list = [
      StatementModel("Jane Mukenya", 'assets/images/deposit.svg',"Ksh 400","+254 787 787 879", "12:45 pm"),
      StatementModel("Jane jashas", 'assets/images/deposit.svg',"Ksh 7568","+254 787 787 879", "12:45 pm"),
      StatementModel("Jane Mukenya", 'assets/images/send.svg',"Ksh 653","+254 787 787 879", "12:45 pm"),
      StatementModel("liadhjld Mukenya", 'assets/images/deposit.svg',"Ksh 4535","+254 787 787 879", "12:45 pm"),
      StatementModel("Jane dhladk", 'assets/images/withdraw.svg',"Ksh 5667","+254 787 787 879", "12:45 pm"),
    ];

    return Scaffold(
      backgroundColor: Colors.brown,
      body: LayoutBuilder(
          builder: (context, constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 250,),
                              Card(
                                elevation: 10,
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "Account balance",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            const Text(
                                                "KSH 90,000",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: (){},
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
                                                color: Colors.grey
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                                "Haba pay",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/Frame.svg'
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
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
                                          fontSize: 18,
                                          color: Colors.grey
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: (){},
                                        child: const Text(
                                            "More",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 14
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                        itemCount: list.length,
                                          itemBuilder: (context, index){
                                            return SingleStatement(
                                                icon: list[index].icon,
                                                onClick: (){},
                                                name: list[index].name,
                                                phoneNumber: list[index].phoneNumber,
                                                amount: list[index].amount,
                                                time: list[index].time
                                            );
                                          }
                                      )
                                  )
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
          }
      ),
    );
  }
}

