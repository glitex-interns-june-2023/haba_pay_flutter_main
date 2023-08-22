import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/description.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/statement_download/controller/statement_download_controller.dart';

final StatementDownloadController statementDownloadController =
Get.put(StatementDownloadController());

final CustomTheme theme = CustomTheme();
class StatementPreparingDownload extends StatelessWidget {
  const StatementPreparingDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Download statement"),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Obx(
                        () => Column(
                          children: [
                            const Spacer(),
                            if (statementDownloadController.isLoading.value)
                              const TitleText(title: "Preparing your Download")
                            else if (statementDownloadController
                                .isDownloaded.value)
                              const TitleText(title: "Download successful")
                            else
                              const TitleText(title: "Download failed"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            if (statementDownloadController.isLoading.value)
                               CircularProgressIndicator(
                                  color: theme.orange)
                            else if (statementDownloadController
                                .isDownloaded.value)
                              SvgPicture.asset(
                                'assets/images/smile_face.svg'
                              )
                            else
                              SvgPicture.asset(
                                  'assets/images/sad_face.svg'
                              ),
                            const Spacer(),
                            if (statementDownloadController.isLoading.value)
                              const Description(
                                  description:
                                      "Your download will begin in \n 30 seconds")
                            else if (statementDownloadController
                                .isDownloaded.value)
                              const Description(
                                  description:
                                      "You have successfully downloaded \n your statement")
                            else
                              const Description(
                                  description: "Something went wrong"),
                            const Spacer(
                              flex: 4,
                            ),
                            const SizedBox(height: 20,),
                            if (!statementDownloadController.isDownloaded.value)
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        statementDownloadController.onCallSupportClicked();
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: theme.orange),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child:  Center(
                                          child: Text(
                                            "Call support",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: theme.orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomButton(title: "Retry", onClick: (){
                                      statementDownloadController.downloadingStatement();
                                    })
                                  ),
                                ],
                              )
                            else
                              CustomButton(title: "Return to Home", onClick: (){
                                statementDownloadController.onReturnHomeClicked();
                              }),
                            const Spacer(),
                          ],
                        ),
                      ),
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
