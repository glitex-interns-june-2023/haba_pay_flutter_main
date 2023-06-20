import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Profile settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(),
                ),
                Text(
                    "Brian Nakamoto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text(
                    "Number : +254 789 890 890",
                ),
                Divider(),
                Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                Text(
                  "briannakamoto@gmail.com",
                ),
                Divider(),
                Text(
                  "Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                Text(
                  "Machakos, kenya",
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

