import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/components/today_title.dart';
import 'package:newspace/utils/constants.dart';

class PageHead extends StatelessWidget {
  const PageHead({
    super.key,
    required this.controller,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: TodayTitle()
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16,),
              const AutoSizeText(
                "   Or search here",
                style: newspaceThinStyle,
                maxLines: 1,
                minFontSize: 8,
                maxFontSize: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                // height: kTextTabBarHeight,
                constraints: const BoxConstraints(
                  minHeight: kTextTabBarHeight/2,
                  maxHeight: kTextTabBarHeight*3
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: TextField(
                    controller: controller,
                    maxLines: 2,
                    minLines: 1,
                    enableSuggestions: true,
                    textInputAction: TextInputAction.go,
                    onSubmitted: onSubmitted,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      filled: true,
                      fillColor: Get.theme.colorScheme.secondary
                    ),
                  )
                )
              ),
            ],
          )
        )
      ],
    );
  }
}