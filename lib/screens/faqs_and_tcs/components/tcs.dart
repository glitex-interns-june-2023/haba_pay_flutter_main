import 'package:flutter/material.dart';
import 'package:haba_pay_main/model/tcs.dart';
import '../../Shared/title_text.dart';
import '../controller/faqs_and_tcs_controller.dart';
import 'package:get/get.dart';

class Tcs extends StatefulWidget {
  const Tcs({super.key});

  @override
  State<Tcs> createState() => _TcsState();
}

class _TcsState extends State<Tcs> {
  final FaqsAndTcsController faqsAndTcsController = Get.put(FaqsAndTcsController());
  final List<TcsModel> list = [
    TcsModel("Term of use", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("Data privacy policy", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("Cookies policy", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("User responsibility", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              const TitleText(title: "Terms and conditions"),
              const SizedBox(height: 20,),
              Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index){
                        return Obx(() =>
                            ExpansionTile(
                              title: Text(list[index].title),
                              onExpansionChanged: (expanded){
                                faqsAndTcsController.toggleTcItem(index);
                              },
                              initiallyExpanded: faqsAndTcsController.expandedTcItems[index] ?? false,
                              children: [
                                ListTile(
                                  title: Text(list[index].description),
                                )
                              ],
                            )
                        );
                      }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
