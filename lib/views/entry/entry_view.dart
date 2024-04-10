import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/entry/entry_controller.dart';

class EntryView extends GetView<EntryController> {
  EntryView({super.key});

  @override
  final controller = Get.put(EntryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.directional(
            top: 0.2 * Get.height,
            start: 0.1 * Get.width,
            textDirection: TextDirection.ltr, 
            child: const Column(
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
            )
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.75),
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
                const AutoSizeText(
                  "A Porto account will be automatically created if you don't have one.",
                  style: newspaceThinStyle,
                  maxLines: 2,
                  minFontSize: 8,
                  maxFontSize: 16,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}