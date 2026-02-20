import 'package:flutter/material.dart';

import '../../../theme/color.dart';
import '../../../theme/styles.dart';

class PickingCell extends StatelessWidget {
  final String title, total, completed, progress, delay;
  const PickingCell(
      {super.key,
      required this.title,
      required this.total,
      required this.completed,
      required this.progress,
      required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorData.whiteColor.withOpacity(0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: int.parse(delay) > 0
                  ? Colors.red
                  : total == "0"
                      ? Colors.transparent
                      : ColorData.greenColor,
            ),
            alignment: Alignment.center,
            child: Text(title, style: Styles.textSmallWithWhite),
          ),
          Visibility(
            // visible: !(total == "0"),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 2),
                  child: Text(total, style: Styles.textCell3, maxLines: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(completed, style: Styles.textCell2, maxLines: 1)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 2),
                  child: Text(progress, style: Styles.textCell1, maxLines: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(delay, style: Styles.textCell4, maxLines: 1),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
