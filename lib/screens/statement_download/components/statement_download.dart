import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/statement_download/controller/statement_download_controller.dart';
import 'package:get/get.dart';


class StatementDownload extends StatefulWidget {
  const StatementDownload({super.key});

  @override
  State<StatementDownload> createState() => _StatementDownloadState();
}

class _StatementDownloadState extends State<StatementDownload> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final StatementDownloadController statementDownloadController = Get.put(StatementDownloadController());
  List<String> transactionType = [
    "Select",
    "transaction type1",
    "transaction type2",
    "transaction type3",
    "transaction type4"
  ];

  List<String> duration = [
    "Select",
    "duration type1",
    "duration type2",
    "duration type3",
    "duration type4"
  ];

  List<String> downloadMethod = [
    "Select",
    "method type1",
    "method type2",
    "method type3",
    "method type4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint){
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                      ),
                      Obx(() => DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          value: statementDownloadController.transactionType.value,
                          items: transactionType.map((String items){
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        onChanged: (String? newValue){
                            statementDownloadController.updateTransactionType(newValue!);
                        },
                      ),),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Duration",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                      ),
                      Row(
                        children: [
                          Obx(() => Expanded(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              value: statementDownloadController.duration.value,
                              items: duration.map((String items){
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue){
                                statementDownloadController.updateDuration(newValue!);
                              },
                            ),
                          ),),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: 65,
                            child: OutlinedButton(
                                onPressed: (){
                                  statementDownloadController.onFilterClicked();
                                },
                                child: SvgPicture.asset(
                                  'assets/images/filter.svg'
                                )
                            ),
                          )
                        ],
                      ),
                      Obx(() => Visibility(
                        visible: statementDownloadController.isFilterClicked.value,
                        child: Row(
                          children: [
                            Expanded(child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        "From",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                        ),
                                      )),
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                    hintText: "mm/dd/yyyy",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  controller: _fromController,
                                ),
                              ],
                            )),
                            const SizedBox(width: 20,),
                            Expanded(child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        "To",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                        ),
                                      )),
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                    hintText: "dd/mm/yyyy",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  controller: _toController,
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Download Method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                      ),
                      Obx(() => DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        value: statementDownloadController.downloadMethod.value,
                        items: downloadMethod.map((String items){
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue){
                          statementDownloadController.updateDownload(newValue!);
                        },
                      ),),
                      const Spacer(),
                      CustomButton(title: "confirm", onClick: (){}),
                      const Spacer()
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
