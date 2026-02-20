import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbis_tv/responsive.dart';

import '../theme/color.dart';
import '../theme/styles.dart';

custCloseAppMessage(BuildContext context) {
  double sHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  double sWidth = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return PopScope(
            canPop: false,
            child: Dialog(
              insetPadding: const EdgeInsets.only(left: 12, right: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                  height: (Responsive.isMobile(context))
                      ? sHeight * 0.3
                      : sHeight * 0.36,
                  width: (Responsive.isMobile(context))
                      ? sWidth * 0.84
                      : sWidth * 0.4,
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: ColorData.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 14, bottom: 14),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    ColorData.menuGrad1Color,
                                    ColorData.menuGrad2Color
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            child: Text("Alert",
                                style: Styles.headerDefaultWithWhite),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, right: 16),
                            child: Text(
                              "Do you want to close the app?",
                              style: Styles.textSemiBold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: Responsive.isMobile(context) ? ElevatedButton.styleFrom(
                                backgroundColor: ColorData.btnColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                ),
                              ) : ButtonStyle(
                                overlayColor:
                                    WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.focused)) {
                                      return ColorData.btn2TextColor;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                ),
                              ),
                              child: Text("Cancel",
                                  style: Styles.textSemiBoldWithWhite)),
                          ElevatedButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              style: Responsive.isMobile(context) ? ElevatedButton.styleFrom( backgroundColor:
                              ColorData.btn2BorderColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                ),) : ButtonStyle(
                                overlayColor:
                                    WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.focused)) {
                                      return ColorData.btn2BorderColor;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                ),
                              ),
                              child: Text("Ok",
                                  style: Styles.textSemiBoldWithWhite)),
                        ],
                      )
                    ],
                  )),
            ));
      });
}
