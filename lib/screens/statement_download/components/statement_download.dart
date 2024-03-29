import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/statement_download/controller/statement_download_controller.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();
final StatementDownloadController statementDownloadController =
    Get.put(StatementDownloadController());

class StatementDownload extends StatelessWidget {
  const StatementDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Download my statement"),
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
                        const TitleText(title: "Statement Download"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Transaction Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Obx(
                          () => DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.orange
                                  )
                              ),
                                errorText: statementDownloadController.transactionTypeError.isNotEmpty
                                    ? statementDownloadController.transactionTypeError.value
                                    : null
                            ),
                            value:
                                statementDownloadController.transactionType.value,
                            items: statementDownloadController.transactionTypeList
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              statementDownloadController
                                  .updateTransactionType(newValue!);
                            },
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Duration",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.orange
                                        )
                                    ),
                                      errorText: statementDownloadController.durationError.isNotEmpty
                                          ? statementDownloadController.durationError.value
                                          : null
                                  ),
                                  value:
                                      statementDownloadController.duration.value,
                                  items: statementDownloadController.durationList
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    statementDownloadController
                                        .updateDuration(newValue!);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 65,
                              child: OutlinedButton(
                                  onPressed: () {
                                    statementDownloadController.onFilterClicked();
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/filter.svg')),
                            )
                          ],
                        ),
                        Obx(
                          () => AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Visibility(
                              visible: statementDownloadController
                                  .isFilterClicked.value,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              "From",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                      ),
                                      Obx(() => TextField(
                                        decoration: InputDecoration(
                                            hintText: "mm/dd/yyyy",
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: theme.orange
                                                )
                                            ),
                                            errorText: statementDownloadController.fromError.isNotEmpty
                                                ? statementDownloadController.fromError.value
                                                : null
                                        ),
                                        cursorColor: theme.orange,
                                        keyboardType: TextInputType.datetime,
                                        controller: statementDownloadController.fromController,
                                      ),),
                                    ],
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.symmetric(vertical: 8),
                                            child: Text(
                                              "To",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                      ),
                                      Obx(() => TextField(
                                        decoration:  InputDecoration(
                                            hintText: "dd/mm/yyyy",
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: theme.orange
                                                )
                                            ),
                                            errorText: statementDownloadController.toError.isNotEmpty
                                                ? statementDownloadController.toError.value
                                                : null
                                        ),
                                        cursorColor: theme.orange,
                                        keyboardType: TextInputType.datetime,
                                        controller: statementDownloadController.toController,
                                      ),),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Download Method",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Obx(
                          () => DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.orange
                                  )
                              ),
                                errorText: statementDownloadController.downloadMethodError.isNotEmpty
                                    ? statementDownloadController.downloadMethodError.value
                                    : null
                            ),
                            value:
                                statementDownloadController.downloadMethod.value,
                            items: statementDownloadController.downloadMethodList
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              statementDownloadController
                                  .updateDownload(newValue!);
                            },
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 20,),
                        CustomButton(title: "confirm", onClick: () {
                          statementDownloadController.onConfirmClicked();
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
      }),
    );
  }
}
