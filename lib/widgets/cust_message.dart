import 'package:flutter/material.dart';
import 'package:tbis_tv/responsive.dart';

import '../theme/color.dart';
import '../theme/styles.dart';

Future<void> customSnackBar(BuildContext context, String msg, int type) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final snackBar = SnackBar(
    width: !Responsive.isMobile(context)
        ? MediaQuery.of(context).size.width * 0.3
        : MediaQuery.of(context).size.width,
    content: Text(msg,
        style: Styles.textSemiBoldWithWhite, textAlign: TextAlign.center),
    backgroundColor: type == 1 ? ColorData.successColor : ColorData.infoColor,
    behavior: SnackBarBehavior.floating,
    elevation: 20,
    duration: const Duration(seconds: 1),
    showCloseIcon: false,
  );
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
