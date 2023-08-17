import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';

class StatementConfirmation extends StatefulWidget {
  const StatementConfirmation({super.key});

  @override
  State<StatementConfirmation> createState() => _StatementConfirmationState();
}

class _StatementConfirmationState extends State<StatementConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Spacer(),
                          TitleText(title: "Statement Download"),
                          const SizedBox(height: 20,),
                          const Divider(),
                          const SizedBox(height: 20,),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Transaction Type",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "All",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Duration",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Jan/01/2023 - Jan/31/2023",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Download Method",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "send via email",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          const Spacer(),
                          CustomButton(title: "Download", onClick: (){}),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
