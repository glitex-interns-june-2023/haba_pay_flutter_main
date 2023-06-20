import 'package:flutter/material.dart';

import '../../dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class UpdateLoginPin extends GetView<BottomNavBarController> {
  const UpdateLoginPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Update login pin",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Current pin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                )
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "New pin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  )
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Confirm pin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  )
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: MaterialButton(onPressed: (){

                },
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.orange,
                  child: const Text(
                      "Update",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              const Spacer()
            ]
          ),
        ),
      ),
    );
  }
}