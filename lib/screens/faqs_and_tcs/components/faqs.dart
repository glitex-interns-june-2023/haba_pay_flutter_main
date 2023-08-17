import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<Faq> list = [
    Faq("How do i complete my profile", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Do i have to add my business", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Can i download all my records", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight,),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(),
                  const TitleText(title: "Frequently asked questions"),
                  Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                          itemBuilder: (context, index){
                            return Obx(() =>
                                ExpansionTile(
                                    title: Text(list[index].title),
                                  onExpansionChanged: (expanded){
                                      faqsAndTcsController.toggleItem(index);
                                  },
                                  initiallyExpanded: faqsAndTcsController.expandedItems[index] ?? false,
                                  children: [
                                    ListTile(
                                      title: Text(list[index].description),
                                    )
                                  ],
                                )
                            );
                          }
                      )
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
