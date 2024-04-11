import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/entry/entry_controller.dart';
import 'package:rive/rive.dart';

class EntryView extends GetView<EntryController> {
  EntryView({super.key});

  @override
  final controller = Get.put(EntryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(-0.8, -0.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Get.isDarkMode? const RiveAnimation.asset(
                    'assets/animations/tristructure - white.riv',
                  ):const RiveAnimation.asset(
                    'assets/animations/tristructure.riv',
                  ),
                ),
                const SizedBox(width: 16,),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: newspaceWelcomeStyle,
                    ),
                    Text(
                      "Newspace",
                      style: newspaceTitleStyle,
                    ),
                    Text(
                      "by Portospace",
                      style: newspaceWelcomeStyle,
                    ),
                  ],
                ),
              ],
            )
          ),
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: ()=>controller.initiateGoogleLogin(), 
                  child: const AutoSizeText(
                    "Login with Google",
                    maxLines: 1,
                    minFontSize: 8,
                    maxFontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  )
                ),
                const SizedBox(height: 4),
                FilledButton(
                  onPressed: ()=>controller.initiateGoogleLogin(), 
                  child: const AutoSizeText(
                    "Login with Apple",
                    maxLines: 1,
                    minFontSize: 8,
                    maxFontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  )
                ),
                const SizedBox(height: 12),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const SizedBox(
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        child: Center(
          child: AutoSizeText(
            "A Porto account will be automatically created if you don't have one.",
            style: newspaceThinStyle,
            maxLines: 2,
            minFontSize: 8,
            maxFontSize: 16,
            overflow: TextOverflow.ellipsis,
          )
        )
      )
    );
  }
}