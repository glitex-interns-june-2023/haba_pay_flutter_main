import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyingTransaction extends StatefulWidget {
  const VerifyingTransaction({super.key});

  @override
  State<VerifyingTransaction> createState() => _VerifyingTransactionState();
}

class _VerifyingTransactionState extends State<VerifyingTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2,),
              const Text(
                  "Verifying transaction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const Spacer(),
              const CircularProgressIndicator(
                color: Colors.orange,
              ),
              const Spacer(),
              const Text(
                  "Your wallet's balance will be \n updated in 30",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 4,),
              MaterialButton(
                  onPressed: () {

                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.orange,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
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
    );
  }
}
