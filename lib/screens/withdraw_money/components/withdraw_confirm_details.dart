import 'package:flutter/material.dart';

class WithdrawConfirmDetails extends StatefulWidget {
  const WithdrawConfirmDetails({super.key});

  @override
  State<WithdrawConfirmDetails> createState() => _WithdrawConfirmDetailsState();
}

class _WithdrawConfirmDetailsState extends State<WithdrawConfirmDetails> {
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
                                "New Balance",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18
                                ),
                              )),
                        ),
                        const Row(
                          children: [
                            Text(
                              "Ksh 900",
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
                                "Phone",
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
                                "Recipient",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Briam Nakamoto",
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
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Ksh. 400",
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {},
                                height: 50,
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
          );
        },
      ),
    );
  }
}
