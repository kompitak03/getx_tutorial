import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Counter.controller.dart';

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final CounterController c = Get.find();

  Other({super.key});

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Other Clicks: ${c.counter}"))),
      body: Center(
        child: ElevatedButton(
          onPressed: (() {
            Get.toNamed('/');
          }),
          child: const Text("Go to Home"),
        ),
      ),
    );
  }
}
