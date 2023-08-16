import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:haba_pay_main/model/StatementModel.dart';
import 'package:haba_pay_main/screens/statement/components/single_statement.dart';
import 'package:haba_pay_main/screens/statement/controller/statement_controller.dart';
import 'package:get/get.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  List<StatementModel> list = [
    StatementModel("Jane Mukenya", 'assets/images/deposit.svg',"Ksh 400","+254 787 787 879", "12:45 pm"),
    StatementModel("Jane jashas", 'assets/images/deposit.svg',"Ksh 7568","+254 787 787 879", "12:45 pm"),
    StatementModel("Jane Mukenya", 'assets/images/send.svg',"Ksh 653","+254 787 787 879", "12:45 pm"),
    StatementModel("liadhjld Mukenya", 'assets/images/deposit.svg',"Ksh 4535","+254 787 787 879", "12:45 pm"),
    StatementModel("Jane dhladk", 'assets/images/withdraw.svg',"Ksh 5667","+254 787 787 879", "12:45 pm"),
  ];
  final StatementController statementController =
      Get.put(StatementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index){
            return SingleStatement(
                icon: list[index].icon,
                onClick: (){},
                name: list[index].name,
                phoneNumber: list[index].phoneNumber,
                amount: list[index].amount,
                time: list[index].time
            );
          }
      ),
    );
  }
}
