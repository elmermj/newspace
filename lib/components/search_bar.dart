import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/utils/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: kTextTabBarHeight,
          width: Get.width * 0.5,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}