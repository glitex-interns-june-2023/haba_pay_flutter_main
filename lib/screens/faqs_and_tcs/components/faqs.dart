import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/faqs_and_tcs/controller/faqs_and_tcs_controller.dart';

import '../../../model/faq.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  final FaqsAndTcsController faqsAndTcsController = Get.put(FaqsAndTcsController());
  final List<Faq> list = [
    Faq("How do i complete my profile", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Do i have to add my business", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Can i download all my records", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              const TitleText(title: "Frequently asked questions"),
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
                                  faqsAndTcsController.toggleFaqItem(index);
                              },
                              initiallyExpanded: faqsAndTcsController.expandedFaqItems[index] ?? false,
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
              const SizedBox(height: 20,),
              CustomButton(title: "contact support", onClick: (){}),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
