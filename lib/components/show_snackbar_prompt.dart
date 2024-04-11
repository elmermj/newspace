import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBarPrompt {
  final String title, message;
  final Duration duration;
  final Function(GetSnackBar)? onTap;

  ShowSnackBarPrompt({
    required this.title,
    required this.message,
    required this.duration,
    this.onTap,
  }){
    Get.isSnackbarOpen?Get.back():null;
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      borderRadius: 0,
      messageText: SizedBox(
        height: kToolbarHeight/1.8,
        child: AutoSizeText(
          message,
          minFontSize: 8,
          maxLines: 3,
          style: TextStyle(
            color: Get.theme.colorScheme.onPrimary
          ),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
      maxWidth: 480,
      overlayBlur: 0.5,
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
      onTap: onTap
    );
  }
}