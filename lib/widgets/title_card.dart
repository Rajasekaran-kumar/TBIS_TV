import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/styles.dart';
import '../utils/constant.dart';

class TitleCard extends StatelessWidget {
  final String title;
  const TitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - Constants.appBarHeight;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 14, left: 10, right: 10),
      width: sWidth,
      color: ColorData.titleBgColor,
      child: Row(
        children: [
          Container(
            height: sHeight * 0.06,
            width: sWidth * 0.004,
            decoration: const BoxDecoration(
              color: ColorData.btn2BorderColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: Styles.textSemiBoldWithBlue,
            ),
          )
        ],
      ),
    );
  }
}
