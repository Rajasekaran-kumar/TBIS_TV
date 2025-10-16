import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ETask extends StatelessWidget {
  final String count;
  final String name;
  final Color bgColor;
  const ETask(
      {super.key,
      required this.count,
      required this.name,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: sWidth * 0.14,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(count, style: Styles.headerDefaultWithWhite),
          Text(
            name,
            textAlign: TextAlign.center,
            style: Styles.textDefaultWithWhite,
          ),
        ],
      ),
    );
  }

  eTask(
      double sWidth, double sHeight, String count, String name, Color bgColor) {
    return;
  }
}
