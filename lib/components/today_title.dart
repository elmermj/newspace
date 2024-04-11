import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newspace/utils/constants.dart';

class TodayTitle extends StatelessWidget {
  const TodayTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    final months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    return Container(
      padding: const EdgeInsets.all(8),
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "What's new on this",
            style: newspaceThinStyle,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 12,
          ),
          AutoSizeText(
            weekdays[DateTime.now().weekday],
            style: newspaceTitleStyle,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 36,
          ),
          AutoSizeText(
            "${DateTime.now().day.toString()} ${months[DateTime.now().month]} ${DateTime.now().year.toString()}",
            style: newspaceThinStyle,
            maxLines: 1,
            minFontSize: 6,
            maxFontSize: 36,
          )
        ],
      ),
    );
  }
}