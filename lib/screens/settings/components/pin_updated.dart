import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

import 'package:get/get.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';

final CustomTheme theme = CustomTheme();
class PinUpdated extends StatelessWidget {
  const PinUpdated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Updating pin"),
      body: LayoutBuilder(
        builder: (context, constraint){
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
                          const Text(
                            "Pin updated",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Divider(),
                          const SizedBox(height: 20,),
                          SvgPicture.asset('assets/images/smile_face.svg'),
                          const Spacer(),
                          const Text(
                            "Cheers!! To being safe \n"
                                "Please keep your PIN secret",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          const Spacer(flex: 4,),
                          MaterialButton(onPressed: (){
                            Get.offAll(()=> const Dashboard(), transition: Transition.rightToLeft);
                          },
                            height: 50,
                            color: theme.orange,
                            minWidth: double.infinity,
                            child:  Text(
                              "Return to home",
                              style: TextStyle(
                                fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: theme.white
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
