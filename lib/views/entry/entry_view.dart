import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/views/entry/entry_controller.dart';

class EntryView extends GetView<EntryController> {
  EntryView({super.key});

  @override
  final controller = Get.put(EntryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Newspace"),
          TextButton(
            onPressed: ()=>controller.initiateLogin(), 
            child: const Text(
              'Sign in with your google account'
            )
          )
        ],
      ),
    );
  }
}