import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                          fontSize: 18
                      ),
                    )),
              ),
              const Row(
                children: [
                  Text(
                      "Ksh 12, 500",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Icon(
                      Icons.visibility_off
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),
              const Text(
                  "Send to",
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )),
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    )),
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
              const Spacer(flex: 2,),
              MaterialButton(
                  onPressed: () {

                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.orange,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "send",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
