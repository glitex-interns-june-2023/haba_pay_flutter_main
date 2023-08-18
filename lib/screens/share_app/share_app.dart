import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

class ShareApp extends StatefulWidget {
  const ShareApp({super.key});

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
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
                              "Share this app",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const Spacer(),
                          const Divider(),
                          const Spacer(),
                          Text(
                              "Haba pay",
                            style: TextStyle(
                              fontSize: 32,
                              color: theme.orange
                            ),
                          ),
                          const Spacer(),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Download link",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.background
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                    child: Text(
                                        "https://bit.ly/HabaPay",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: theme.orange
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.background
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: SvgPicture.asset(
                                      'assets/images/copy.svg'
                                  ),
                                )
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
                              color: Colors.orange,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  "Share app",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                ),
                              )
                          ),
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
