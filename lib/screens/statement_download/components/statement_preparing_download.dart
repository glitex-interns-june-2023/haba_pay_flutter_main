import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/Shared/description.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/statement_download/controller/statement_download_controller.dart';

class StatementPreparingDownload extends StatefulWidget {
  const StatementPreparingDownload({super.key});

  @override
  State<StatementPreparingDownload> createState() =>
      _StatementPreparingDownloadState();
}

class _StatementPreparingDownloadState
    extends State<StatementPreparingDownload> {
  final StatementDownloadController statementDownloadController =
      Get.put(StatementDownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Obx(
                        () => Column(
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            if (statementDownloadController.isLoading.value)
                              const TitleText(title: "Preparing your Download")
                            else if (statementDownloadController
                                .isDownloaded.value)
                              const TitleText(title: "Download successful")
                            else
                              const TitleText(title: "Download failed"),
                            const SizedBox(
                              height: 30,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            if (statementDownloadController.isLoading.value)
                              const CircularProgressIndicator(
                                  color: Colors.orange)
                            else if (statementDownloadController
                                .isDownloaded.value)
                              const Image(
                                  image: AssetImage(
                                      'assets/images/smile_face.png'))
                            else
                              const Image(
                                  image:
                                      AssetImage('assets/images/sad_face.png')),
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
                            if (!statementDownloadController.isDownloaded.value)
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            "Call support",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {
                                        statementDownloadController
                                            .downloadingStatement();
                                      },
                                      height: 50,
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        "Retry",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              MaterialButton(
                                  onPressed: () {
                                    statementDownloadController
                                        .downloadingStatement();
                                  },
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: Colors.orange,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
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
                  ),
                )),
          );
        },
      ),
    );
  }
}
