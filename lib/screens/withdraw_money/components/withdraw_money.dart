import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

final TextEditingController _phoneNumberController = TextEditingController();

final TextEditingController _amountController = TextEditingController();
final CustomTheme theme = CustomTheme();
class WithdrawMoney extends StatelessWidget {
  const WithdrawMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
        appBar: const CustomAppBar(title: "Withdraw money"),
        body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
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
                              style: TextStyle(fontSize: 18),
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      MaterialButton(
                          onPressed: () {},
                          height: 50,
                          minWidth: double.infinity,
                          color: Colors.orange,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              "Proceed with number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Use ",
                            style: TextStyle(fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "my number",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 18),
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
        ),
      );
    }));
  }
}
