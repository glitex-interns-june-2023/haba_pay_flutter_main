import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

import 'create_login_pin.dart';

final CustomTheme theme = CustomTheme();
class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset('assets/images/step_2.svg'),
                      const SizedBox(height: 20,),
                      const Text(
                        "Verification successful",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/images/smile_face.svg'),
                      const Spacer(flex: 4,),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MaterialButton(onPressed: (){
                          Get.to(()=>const CreateLoginPin(), transition: Transition.rightToLeft);
                        },
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.white,
                                    fontSize: 18
                                ),
                              ),
                            )
                        ),
                      ),
                      const Spacer()
                    ],
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
