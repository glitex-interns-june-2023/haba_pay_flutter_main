import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/faqs_and_tcs/controller/faqs_and_tcs_controller.dart';

import '../../../model/faq.dart';

final FaqsAndTcsController faqsAndTcsController = Get.put(FaqsAndTcsController());
final CustomTheme theme = CustomTheme();

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Frequently asked questions"),
      body: LayoutBuilder(
        builder: (context, constraint) {
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
                          const TitleText(title: "Frequently asked questions"),
                          const SizedBox(height: 20,),
                          Expanded(
                            flex: 5,
                              child: ListView.builder(
                                itemCount: faqsAndTcsController.list.length,
                                  itemBuilder: (context, index){
                                    return Obx(() =>
                                        ExpansionTile(
                                          textColor: theme.black,
                                            iconColor: theme.black,
                                            title: Text(faqsAndTcsController.list[index].title),
                                          onExpansionChanged: (expanded){
                                              faqsAndTcsController.toggleFaqItem(index);
                                          },
                                          initiallyExpanded: faqsAndTcsController.expandedFaqItems[index] ?? false,
                                          children: [
                                            ListTile(
                                              title: Text(faqsAndTcsController.list[index].description),
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
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
