import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:haba_pay_main/screens/statement/controller/statement_controller.dart';
import 'package:get/get.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  final StatementController statementController =
      Get.put(StatementController());

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() => OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    statementController.isAllPressed == true.obs
                                        ? Colors.transparent
                                        : Colors.orange)),
                            onPressed: () {
                              statementController.isAllPressed = true.obs;
                              print("================================${statementController.isAllPressed.value}");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("All")],
                            )))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
