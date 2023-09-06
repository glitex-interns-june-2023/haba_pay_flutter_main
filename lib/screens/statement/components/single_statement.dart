import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SingleStatement extends StatefulWidget {
  final String type;
  final String name;
  final String phoneNumber;
  final int amount;
  final String time;

  final Function() onClick;
  const SingleStatement({
    super.key,
    required this.type,
    required this.onClick,
    required this.name,
    required this.phoneNumber,
    required this.amount,
    required this.time
  });

  @override
  State<SingleStatement> createState() => _SingleStatementState();
}

class _SingleStatementState extends State<SingleStatement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onClick,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(widget.type == "sent")
                      SvgPicture.asset(
                        'assets/images/send.svg',
                        color: Colors.orange,
                      )
                    else if(widget.type == "deposit")
                      SvgPicture.asset(
                        'assets/images/deposit.svg',
                        color: Colors.orange,
                      )
                     else
                      SvgPicture.asset(
                        'assets/images/withdraw.svg',
                        color: Colors.orange,
                      )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        widget.name.capitalizeFirst ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        widget.phoneNumber,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        "${widget.amount}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        widget.time,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
