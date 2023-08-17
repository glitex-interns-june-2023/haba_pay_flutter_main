import 'package:flutter/material.dart';
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
    "select",
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
                          "Category",
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
                  ),)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
