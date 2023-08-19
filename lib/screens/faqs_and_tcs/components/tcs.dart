import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import '../../Shared/title_text.dart';
import '../controller/faqs_and_tcs_controller.dart';
import 'package:get/get.dart';

final FaqsAndTcsController faqsAndTcsController =
    Get.put(FaqsAndTcsController());
final CustomTheme theme = CustomTheme();

class Tcs extends StatelessWidget {
  const Tcs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Terms and conditions"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                const TitleText(title: "Terms and conditions"),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: faqsAndTcsController.tcList.length,
                        itemBuilder: (context, index) {
                          return Obx(() => ExpansionTile(
                                iconColor: theme.black,
                                textColor: theme.black,
                                title: Text(
                                    faqsAndTcsController.tcList[index].title),
                                onExpansionChanged: (expanded) {
                                  faqsAndTcsController.toggleTcItem(index);
                                },
                                initiallyExpanded: faqsAndTcsController
                                        .expandedTcItems[index] ??
                                    false,
                                children: [
                                  ListTile(
                                    title: Text(faqsAndTcsController
                                        .tcList[index].description),
                                  )
                                ],
                              ));
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
