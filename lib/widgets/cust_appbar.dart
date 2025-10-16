import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';
import '../theme/styles.dart';
import '../utils/constant.dart';
import 'clock.dart';

class CustAppbar extends StatelessWidget {
  const CustAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorData.btn2BorderColor,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/logo.svg",
            height: sHeight * 0.06,
            colorFilter:
                const ColorFilter.mode(ColorData.whiteColor, BlendMode.srcIn),
          ),
          Text("Mandal", style: Styles.headerDefaultWithWhite),
          // DropdownMenu<IconLabel>(
          //   // initialSelection: ColorLabel.green,
          //   controller: iconController,
          //   requestFocusOnTap: true,
          //   label: const Text('Color'),
          //   onSelected: (IconLabel? color) {
          //     setState(() {
          //       selectedIcon = color;
          //     });
          //   },
          //   dropdownMenuEntries: IconLabel.values
          //       .map<DropdownMenuEntry<IconLabel>>((IconLabel color) {
          //     return DropdownMenuEntry<IconLabel>(
          //       value: color,
          //       label: color.label,
          //       enabled: color.label != 'Grey',
          //       style: MenuItemButton.styleFrom(
          //         foregroundColor: Colors.red,
          //       ),
          //     );
          //   }).toList(),
          // ),
          const ClockWidget(),
        ],
      ),
    );
  }
}
