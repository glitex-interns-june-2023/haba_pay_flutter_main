import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingleStatement extends StatefulWidget {
  final String icon;
  final String name;
  final String phoneNumber;
  final String amount;
  final String time;

  final Function() onClick;
  const SingleStatement({
    super.key,
    required this.icon,
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
        Row(
          children: [
            SvgPicture.asset(
              widget.icon,
              color: Colors.orange,
            ),
          ],
        ),
        const SizedBox(width: 20,),
        Row(
          children: [
            Text(
                widget.name,
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
        Row(
          children: [
            Text(
                widget.amount,
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
        )
      ],
    );
  }
}
