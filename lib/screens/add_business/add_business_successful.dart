import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddBusinessSuccessful extends StatefulWidget {
  const AddBusinessSuccessful({super.key});

  @override
  State<AddBusinessSuccessful> createState() => _AddBusinessSuccessfulState();
}

class _AddBusinessSuccessfulState extends State<AddBusinessSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text(
                        "Process successful",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/smile_face.svg'
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
