import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WithdrawTo extends StatefulWidget {
  const WithdrawTo({super.key});

  @override
  State<WithdrawTo> createState() => _WithdrawToState();
}

class _WithdrawToState extends State<WithdrawTo> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey
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
                          "Withdraw to",
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

                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: Colors.orange,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/mpesa.svg'),
                                    const Text(
                                      " Deposit from mpesa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                )
                            )),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Deposit from ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18
                              ),
                            ),
                            InkWell(
                              child: Text(
                                "new number",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange
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
          );
        },
      ),
    );
  }
}