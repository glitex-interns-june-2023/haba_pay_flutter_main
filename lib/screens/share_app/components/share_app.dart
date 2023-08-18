import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/share_app/controller/share_app_controller.dart';

CustomTheme theme = CustomTheme();
final ShareAppController shareAppController = ShareAppController();

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Share app"),
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
                        const Text(
                          "Share this app",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Haba pay",
                          style: TextStyle(fontSize: 32, color: theme.orange),
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Download link",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: theme.background),
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    "https://bit.ly/HabaPay",
                                    style: TextStyle(
                                        fontSize: 18, color: theme.orange),
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                shareAppController
                                    .copyToClipBoard("https://bit.ly/HabaPay");
                              },
                              child: Container(
                                  decoration:
                                      BoxDecoration(color: theme.background),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SvgPicture.asset(
                                        'assets/images/copy.svg'),
                                  )),
                            )
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        MaterialButton(
                            onPressed: () {
                              shareAppController.shareApp();
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "Share app",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.white,
                                    fontSize: 20),
                              ),
                            )),
                        const Spacer()
                      ],
                    ),
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
