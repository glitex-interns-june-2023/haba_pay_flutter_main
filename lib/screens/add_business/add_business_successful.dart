import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

class AddBusinessSuccessful extends StatefulWidget {
  const AddBusinessSuccessful({super.key});

  @override
  State<AddBusinessSuccessful> createState() => _AddBusinessSuccessfulState();
}

class _AddBusinessSuccessfulState extends State<AddBusinessSuccessful> {
  CustomTheme theme = CustomTheme();
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
                          const Text(
                            "Process successful",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/images/smile_face.svg',
                            color: theme.orange,
                          ),
                          const Spacer(),
                          const Text(
                            "Offers will be customized to your \n business and location.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Read about our ",
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Text(
                                    "data privacy",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: theme.orange
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          MaterialButton(
                              onPressed: () {},
                              height: 50,
                              minWidth: double.infinity,
                              color: theme.orange,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  "Go to Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.white,
                                      fontSize: 20),
                                ),
                              )
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}