import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/model/StatementDownloadModel.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/statement_download/components/statement_download_confirm_identity.dart';
import 'package:haba_pay_main/screens/statement_download/controller/statement_download_controller.dart';
import 'package:get/get.dart';

final StatementDownloadController statementDownloadController = Get.put(StatementDownloadController());
final CustomTheme theme = CustomTheme();

class StatementConfirmation extends StatelessWidget {
  const StatementConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    final downloadModel = Get.arguments as StatementDownloadModel;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Confirm statement"),
      body: LayoutBuilder(
          builder: (context, constraint){
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
                            const TitleText(title: "Statement Download"),
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
                             Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    downloadModel.transactionType,
                                    style: const TextStyle(fontSize: 18),
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
                             Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    downloadModel.duration,
                                    style: const TextStyle(fontSize: 18),
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
                             Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    downloadModel.downloadMethod,
                                    style: const TextStyle(fontSize: 18),
                                  )),
                            ),
                            const Spacer(),
                            const SizedBox(height: 20,),
                            CustomButton(title: "Download", onClick: (){
                              Get.to(() => const StatementDownloadConfirmIdentity(),
                                  transition: Transition.rightToLeft,
                              );
                            }),
                            const Spacer()
                          ],
                        ),
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
