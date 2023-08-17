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
  final StatementDownloadController statementDownloadController = Get.put(StatementDownloadController());
  List<String> transactionType = [
    "Select",
    "transaction type1",
    "transaction type2",
    "transaction type3",
    "transaction type4"
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
                            ),
                          ),),
                          const SizedBox(width: 5,),
                          OutlinedButton(
                              onPressed: (){},
                              child: SvgPicture.asset(
                                'assets/images/filter.svg'
                              )
                          )
                        ],
                      ),
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
