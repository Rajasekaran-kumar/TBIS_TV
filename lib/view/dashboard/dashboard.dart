import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/styles.dart';
import '../../utils/constant.dart';
import '../../widgets/e_task.dart';
import '../../widgets/title_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - Constants.appBarHeight;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sHeight,
      width: sWidth,
      color: ColorData.whiteColor,
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: sHeight * 0.34,
                  width: sWidth * 0.24,
                  decoration: BoxDecoration(
                    color: ColorData.whiteColor,
                    border: Border.all(color: ColorData.listBorderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            color: ColorData.btn2BorderColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Truck Receiving",
                              style: Styles.textSemiBoldWithWhite,
                            ),
                            const Icon(
                              Icons.fire_truck_outlined,
                              color: ColorData.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("No. of Trucks", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.btn2BorderColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("On Time", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.greenBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Not Reached", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.redBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Not Unloaded", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.orangeBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: sHeight * 0.34,
                  width: sWidth * 0.24,
                  decoration: BoxDecoration(
                    color: ColorData.whiteColor,
                    border: Border.all(color: ColorData.listBorderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            color: ColorData.btn2BorderColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style: Styles.textSemiBoldWithWhite,
                            ),
                            const Icon(
                              Icons.fire_truck_outlined,
                              color: ColorData.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("No. of DI", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.btn2BorderColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("On Time", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.greenBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delayed", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.redBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Revised DI", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.orangeBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: sHeight * 0.34,
                  width: sWidth * 0.24,
                  decoration: BoxDecoration(
                    color: ColorData.whiteColor,
                    border: Border.all(color: ColorData.listBorderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            color: ColorData.btn2BorderColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SRV",
                              style: Styles.textSemiBoldWithWhite,
                            ),
                            const Icon(
                              Icons.fire_truck_outlined,
                              color: ColorData.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Srv", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.btn2BorderColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("On Time", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.greenBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delayed", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.orangeBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Short/Excess", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.redBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: sHeight * 0.34,
                  width: sWidth * 0.24,
                  decoration: BoxDecoration(
                    color: ColorData.whiteColor,
                    border: Border.all(color: ColorData.listBorderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            color: ColorData.btn2BorderColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Stock",
                              style: Styles.textSemiBoldWithWhite,
                            ),
                            const Icon(
                              Icons.fire_truck_outlined,
                              color: ColorData.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Before Inspection",
                                style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.btn2BorderColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quality Check", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.orangeBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("1000",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("FG Area", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.redBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Stock", style: Styles.textSemiBold),
                            Container(
                              width: sWidth * 0.06,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: ColorData.greenBgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("0",
                                  style: Styles.textSemiBoldWithWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const TitleCard(title: 'TimeLine'),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Card(
              elevation: 0.0,
              color: ColorData.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: ColorData.borderColor.withOpacity(0.5)),
              ),
              child: Table(
                border: const TableBorder.symmetric(
                    inside: BorderSide(width: 1),
                    outside: BorderSide(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                // border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                        color: ColorData.btn2BorderColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                        child:
                            Text('Time', style: Styles.textSemiBoldWithWhite),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.orangeBgColor.withOpacity(0.7),
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          alignment: Alignment.center,
                          child: Text('06:00 - 09:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.orangeBgColor.withOpacity(0.7),
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          alignment: Alignment.center,
                          child: Text('09:00 - 12:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.yellowBgColor.withOpacity(0.7),
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          alignment: Alignment.center,
                          child: Text('12:00 - 15:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.yellowBgColor.withOpacity(0.7),
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          alignment: Alignment.center,
                          child: Text('15:00 - 18:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.greenBgColor.withOpacity(0.7),
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          alignment: Alignment.center,
                          child: Text('18:00 - 21:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              color: ColorData.greenBgColor.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8))),
                          alignment: Alignment.center,
                          child: Text('21:00 - 00:00',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: ColorData.btn2BorderColor,
                          padding:
                              const EdgeInsets.only(left: 8, top: 1, bottom: 1),
                          child: Text('Receiving',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("3", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("3", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("1", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("1", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 8, top: 1, bottom: 1),
                          decoration: const BoxDecoration(
                              color: ColorData.btn2BorderColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8))),
                          child: Text('Dispatch',
                              style: Styles.textSemiBoldWithWhite),
                        ),
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("3", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                      Table(
                        border: const TableBorder(verticalInside: BorderSide()),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 4, bottom: 4),
                              child: Text("0", style: Styles.textSemiBold),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const TitleCard(title: 'eWMS Task'),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Card(
              elevation: 0.0,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ETask(
                        count: '4',
                        name: 'On Hold Order',
                        bgColor: ColorData.orangeBgColor,
                      ),
                      ETask(
                        count: '500',
                        name: 'Picking Unassigned',
                        bgColor: ColorData.yellowBgColor,
                      ),
                      ETask(
                        count: '100',
                        name: 'Awaiting Ship Out',
                        bgColor: ColorData.darkBlueBgColor,
                      ),
                      ETask(
                        count: '6',
                        name: 'Complete Order',
                        bgColor: ColorData.greenBgColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
