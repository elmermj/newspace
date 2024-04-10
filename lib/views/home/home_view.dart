import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/views/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newspace'),
      ),
      body: Container(
        child: const Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}