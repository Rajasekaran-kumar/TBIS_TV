import 'dart:convert';
import 'dart:developer';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:intl/intl.dart';

import '../../model/customer_model.dart';
import '../../model/warehouse_model.dart';
import '../../repo/service_repo.dart';
import '../../responsive.dart';
import '../../tbis_core/model/meta.dart';
import '../../theme/color.dart';
import '../../theme/styles.dart';
import '../../utils/constant.dart';
import '../dock/components/header.dart';

List<WarehouseModel> custList = [];
List<WarehouseModel> partList = [];
List<BIAreaResult> biAreaList = [];
List<FGAreaModel> fgAreaList = [];
SpaceWiseModel spaceList = SpaceWiseModel();

WarehouseModel selectedCustomer = WarehouseModel();

class CustomerPage extends StatefulWidget {
  final WarehouseModel custDashData;
  const CustomerPage({super.key, required this.custDashData});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  ScrollController scrollController = ScrollController();
  int listCount = 6;
  int screenId = 0;
  bool load = false;

  @override
  void initState() {
    screenId = 0;
    custList.clear();
    partList.clear();
    spaceList = SpaceWiseModel();
    selectedCustomer = WarehouseModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        controller: scrollController,
        padding: EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          children: [
            Header(title: screenId == 0 ? 'Stock Status' : ""),
            SizedBox(height: Constants.defaultPadding),
            screenId == 0
                ? infoPage(sWidth, sHeight, widget.custDashData)
                : screenId == 1
                    ? customerListPage(sWidth, sHeight)
                    : screenId == 2
                        ? customerWisePage(sWidth, sHeight)
                        : screenId == 3
                            ? partWisePage(sWidth, sHeight)
                            : screenId == 4
                                ? spaceWisePage(sWidth, sHeight)
                                : screenId == 5
                                    ? custBeforeInspection(sWidth, sHeight)
                                    : custFGArea(sWidth, sHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!Responsive.isMobile(context))
                  Text(
                      "Last updated at ${DateFormat("HH:mm:ss").format(Constants.lastUpdated ?? DateTime.now())}",
                      style: Styles.textSmallWithWhite),
              ],
            ),
          ],
        ),
      ),
    );
  }

  infoPage(double sWidth, double sHeight, WarehouseModel custDashData) {
    double infoElevationVal = 0.0;
    bool focused = false;
    double cardHeight = sHeight * 0.24;
    double cardWidth = sWidth * 0.18;
    double cardHeightMobile = sHeight * 0.12;
    double cardWidthMobile = sWidth * 0.3;
    voidCallBack() async {
      Meta m = await ServiceRepository()
          .getCustomerListService(warehouseId: Constants.warehouseId);
      if (m.statusCode == 200) {
        if (m.response.isNotEmpty) {
          custList.clear();
          for (var v in m.response['result']) {
            custList.add(WarehouseModel.fromJson(v));
          }
          setState(() {});
        }
      }
    }

    if (Responsive.isMobile(context)) {
      List<Widget> menuData = [
        Column(
          children: [
            custDataTitleCard(
                cardWidthMobile, Colors.yellow, "Available", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.availableStock ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFF00b050),
                "FG Stock", Colors.white),
            custDataCard(
                cardWidthMobile, cardHeightMobile, custDashData.fgStock ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFFffc000),
                "Hold Stock", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.holdStock ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(
                cardWidthMobile, Colors.red, "NG Stock", Colors.white),
            custDataCard(
                cardWidthMobile, cardHeightMobile, custDashData.ngStock ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFF002060), "Total",
                Colors.white),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.totalStock ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFFe49edd),
                "Today Supply", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.todaySupply ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFF00b0f0),
                "Next Day Supply", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.nextDaySupply ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(
                cardWidthMobile, Colors.red, "Abnormality", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.abnormality ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFF7030a0),
                "Total Inward Vehicle", Colors.white),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.totalInwardVehicle ?? "-"),
          ],
        ),
        Column(
          children: [
            custDataTitleCard(cardWidthMobile, const Color(0xFFb3e5a1),
                "Total Outward Vehicle", Colors.black),
            custDataCard(cardWidthMobile, cardHeightMobile,
                custDashData.totalOutwardVehicle ?? "-"),
          ],
        )
      ];
      return SizedBox(
        height: sHeight * 0.8,
        width: sWidth,
        child: InkWell(
          onTap: () async {
            await voidCallBack();
            screenId = 1;
            setState(() {});
          },
          child: AutoHeightGridView(
            itemCount: menuData.length,
            controller: scrollController,
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            // mainAxisSpacing: sHeight * 0.02,
            // crossAxisSpacing: sWidth * 0.08,
            builder: (BuildContext context, int index) {
              return menuData[index];
            },
          ),
        ),
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter infoSetState) {
        return Focus(
          autofocus: focused,
          onFocusChange: (value) => {
            focused = value,
            if (focused)
              {
                infoElevationVal = 8.0,
              }
            else
              {
                infoElevationVal = 0.0,
              },
            infoSetState(() {}),
          },
          child: InkWell(
            onTap: () async {
              await voidCallBack();
              // custList.addAll(custTempList);
              screenId = 1;
              infoSetState(() {});
              setState(() {});
            },
            child: Card(
              elevation: infoElevationVal,
              margin: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(Constants.defaultPadding),
                width: sWidth,
                decoration: BoxDecoration(
                  color: focused
                      ? Constants.primaryColor.withOpacity(0.4)
                      : Constants.secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        custDataTitleCard(cardWidth, Colors.yellow, "Available",
                            Colors.black),
                        custDataTitleCard(cardWidth, const Color(0xFF00b050),
                            "FG Stock", Colors.white),
                        custDataTitleCard(cardWidth, const Color(0xFFffc000),
                            "Hold Stock", Colors.black),
                        custDataTitleCard(
                            cardWidth, Colors.red, "NG Stock", Colors.white),
                        custDataTitleCard(cardWidth, const Color(0xFF002060),
                            "Total", Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custDataCard(cardWidth, cardHeight,
                            custDashData.availableStock ?? "-"),
                        custDataCard(
                            cardWidth, cardHeight, custDashData.fgStock ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.holdStock ?? "-"),
                        custDataCard(
                            cardWidth, cardHeight, custDashData.ngStock ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.totalStock ?? "-"),
                      ],
                    ),
                    SizedBox(
                      height: sHeight * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        custDataTitleCard(cardWidth, const Color(0xFFe49edd),
                            "Today Supply", Colors.black),
                        custDataTitleCard(cardWidth, const Color(0xFF00b0f0),
                            "Next Day Supply", Colors.black),
                        custDataTitleCard(
                            cardWidth, Colors.red, "Abnormality", Colors.black),
                        custDataTitleCard(cardWidth, const Color(0xFF7030a0),
                            "Total Inward Vehicle", Colors.white),
                        custDataTitleCard(cardWidth, const Color(0xFFb3e5a1),
                            "Total Outward Vehicle", Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custDataCard(cardWidth, cardHeight,
                            custDashData.todaySupply ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.nextDaySupply ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.abnormality ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.totalInwardVehicle ?? "-"),
                        custDataCard(cardWidth, cardHeight,
                            custDashData.totalOutwardVehicle ?? "-"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          onKeyEvent: (_, event) {
            return KeyEventResult.ignored;
          },
        );
      });
    }
  }

  customerListPage(double sWidth, double sHeight) {
    int custCurrentIndex = -1;
    double custElevationVal = 0.0;
    double cardHeight = sHeight * 0.11;

    voidCallBack(int index) async {
      if (custList.isNotEmpty) {
        selectedCustomer = custList[index];
        setState(() {});
      }
    }

    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    screenId = 0;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Customer"),
            ],
          ),
          SizedBox(
            height: sHeight * 0.8,
            width: sWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custListTitle(sWidth * 0.6, cardHeight, Colors.white,
                          "Customer", Colors.black),
                      custListTitle(sWidth * 0.2, cardHeight, Colors.yellow,
                          "Stock IN", Colors.black),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFF00b050), "FG Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFFffc000), "Hold Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight, Colors.red,
                          "NG Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFF002060), "Total", Colors.white),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFFe49edd),
                          "Today Supply",
                          Colors.black),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFF00b0f0),
                          "Next Day Supply",
                          Colors.black),
                      custListTitle(sWidth * 0.2, cardHeight, Colors.red,
                          "Abnormality", Colors.white),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFF7030a0),
                          "Inward Vehicle",
                          Colors.white),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFFb3e5a1),
                          "Outward Vehicle",
                          Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: sHeight * 0.64,
                    width: sWidth * 2.6,
                    child: ListView.builder(
                        itemCount: custList.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () async {
                              print(
                                  ":::::::::::::: $index - ${custList[index].customerId}");
                              await voidCallBack(index);
                              print("TTTTTTTTTTTTTT ${selectedCustomer}");
                              screenId = 2;
                              setState(() {});
                            },
                            child: Card(
                              elevation: custElevationVal,
                              margin: EdgeInsets.zero,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  custListData(
                                      sWidth * 0.6,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      custList[index].customerName ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      true),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.yellow
                                          : Colors.transparent,
                                      custList[index].availableStock ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF00b050)
                                          : Colors.transparent,
                                      custList[index].fgStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFffc000)
                                          : Colors.transparent,
                                      custList[index].holdStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.red
                                          : Colors.transparent,
                                      custList[index].ngStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF002060)
                                          : Colors.transparent,
                                      custList[index].totalStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFe49edd)
                                          : Colors.transparent,
                                      custList[index].todaySupply ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF00b0f0)
                                          : Colors.transparent,
                                      custList[index].nextDaySupply ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.red
                                          : Colors.transparent,
                                      custList[index].abnormality ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF7030a0)
                                          : Colors.transparent,
                                      custList[index].totalInwardVehicle ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFb3e5a1)
                                          : Colors.transparent,
                                      custList[index].totalOutwardVehicle ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter custSetState) {
        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          screenId = 0;
                          custSetState(() {});
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text("Customer"),
                  ],
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custListTitle(sWidth * 0.2, cardHeight, Colors.white,
                      "Customer", Colors.black),
                  custListTitle(sWidth * 0.08, cardHeight, Colors.yellow,
                      "Stock IN", Colors.black),
                  custListTitle(sWidth * 0.08, cardHeight,
                      const Color(0xFF00b050), "FG Stock", Colors.white),
                  custListTitle(sWidth * 0.08, cardHeight,
                      const Color(0xFFffc000), "Hold Stock", Colors.white),
                  custListTitle(sWidth * 0.08, cardHeight, Colors.red,
                      "NG Stock", Colors.white),
                  custListTitle(sWidth * 0.08, cardHeight,
                      const Color(0xFF002060), "Total", Colors.white),
                  custListTitle(sWidth * 0.08, cardHeight,
                      const Color(0xFFe49edd), "Today Supply", Colors.black),
                  custListTitle(sWidth * 0.07, cardHeight,
                      const Color(0xFF00b0f0), "Next Day Supply", Colors.black),
                  custListTitle(sWidth * 0.09, cardHeight, Colors.red,
                      "Abnormality", Colors.white),
                  custListTitle(sWidth * 0.07, cardHeight,
                      const Color(0xFF7030a0), "Inward Vehicle", Colors.white),
                  custListTitle(sWidth * 0.07, cardHeight,
                      const Color(0xFFb3e5a1), "Outward Vehicle", Colors.black),
                ],
              ),
              FocusTraversalOrder(
                order: const NumericFocusOrder(1.0),
                child: SizedBox(
                  width: sWidth,
                  height: sHeight * 0.64,
                  child: ListView.builder(
                      itemCount: custList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Focus(
                          autofocus: true,
                          onFocusChange: (value) => {
                            if (value == true)
                              {
                                custCurrentIndex = index,
                                custElevationVal = 8.0,
                              }
                            else
                              {
                                if (custCurrentIndex == 0)
                                  {
                                    custCurrentIndex = -1,
                                  },
                                custElevationVal = 0.0,
                              },
                            custSetState(() {}),
                          },
                          child: InkWell(
                            onTap: () async {
                              print(
                                  ":::::::::::::: $index - ${custList[index].customerId}");
                              await voidCallBack(index);
                              screenId = 2;
                              custSetState(() {});
                              setState(() {});
                            },
                            child: Card(
                              elevation: custElevationVal,
                              margin: EdgeInsets.zero,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  custListData(
                                      sWidth * 0.2,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      custList[index].customerName ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      true),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.yellow
                                          : Colors.transparent,
                                      custList[index].availableStock ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF00b050)
                                          : Colors.transparent,
                                      custList[index].fgStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFffc000)
                                          : Colors.transparent,
                                      custList[index].holdStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.red
                                          : Colors.transparent,
                                      custList[index].ngStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF002060)
                                          : Colors.transparent,
                                      custList[index].totalStock ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.08,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFe49edd)
                                          : Colors.transparent,
                                      custList[index].todaySupply ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.07,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF00b0f0)
                                          : Colors.transparent,
                                      custList[index].nextDaySupply ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.09,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? Colors.red
                                          : Colors.transparent,
                                      custList[index].abnormality ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.07,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFF7030a0)
                                          : Colors.transparent,
                                      custList[index].totalInwardVehicle ?? "",
                                      Colors.white,
                                      false),
                                  custListData(
                                      sWidth * 0.07,
                                      cardHeight,
                                      custCurrentIndex == index
                                          ? const Color(0xFFb3e5a1)
                                          : Colors.transparent,
                                      custList[index].totalOutwardVehicle ?? "",
                                      custCurrentIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      false),
                                ],
                              ),
                            ),
                          ),
                          onKeyEvent: (_, event) {
                            return KeyEventResult.ignored;
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  custFGAreaOld(double sWidth, double sHeight) {
    int custCurrentIndex = -1;
    double custElevationVal = 0.0;
    double cardHeight = sHeight * 0.08;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter custFGSetState) {
      return FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Column(
          children: [
            FocusTraversalOrder(
              order: const NumericFocusOrder(2.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        screenId = 2;
                        custFGSetState(() {});
                        setState(() {});
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text("Good Stock"),
                ],
              ),
            ),
            SizedBox(height: Constants.defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                custListTitle(sWidth * 0.46, cardHeight, Colors.white,
                    "Part No", Colors.black),
                custListTitle(sWidth * 0.1, cardHeight, Colors.yellow, "Stock",
                    Colors.black),
                custListTitle(sWidth * 0.42, cardHeight,
                    const Color(0xFF00b050), "Allocation", Colors.white),
              ],
            ),
            FocusTraversalOrder(
              order: const NumericFocusOrder(1.0),
              child: SizedBox(
                width: sWidth,
                height: sHeight * 0.64,
                child: ListView.builder(
                    itemCount: custList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Focus(
                        autofocus: true,
                        onFocusChange: (value) => {
                          if (value == true)
                            {
                              custCurrentIndex = index,
                              custElevationVal = 8.0,
                            }
                          else
                            {
                              if (custCurrentIndex == 0)
                                {
                                  custCurrentIndex = -1,
                                },
                              custElevationVal = 0.0,
                            },
                          custFGSetState(() {}),
                        },
                        child: Card(
                          elevation: custElevationVal,
                          margin: EdgeInsets.zero,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custAreaListData(
                                  sWidth * 0.46,
                                  cardHeight,
                                  custCurrentIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  "02162M0616E",
                                  custCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white),
                              custAreaListData(
                                  sWidth * 0.1,
                                  cardHeight,
                                  custCurrentIndex == index
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  custList[index].availableStock ?? "",
                                  custCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: sWidth * 0.42,
                                    minWidth: sWidth * 0.42,
                                    maxHeight: sHeight * 0.4,
                                    minHeight: cardHeight),
                                child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 10,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      childAspectRatio: 2.5,
                                      maxCrossAxisExtent: sWidth * 0.1,
                                      mainAxisExtent: sHeight * 0.12,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(2),
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white)),
                                              child: const Text("L50C39"),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 4),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.lock),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text("04"),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        onKeyEvent: (_, event) {
                          return KeyEventResult.ignored;
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }

  customerWisePage(double sWidth, double sHeight) {
    double custWiseElevationVal = 0.0;
    double cardHeight = sHeight * 0.18;
    double cardWidth = sWidth * 0.18;
    double cardHeightMobile = sHeight * 0.12;
    double cardWidthMobile = sWidth * 0.3;
    List<Widget> menuData = [
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, Colors.yellow, "Available", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.availableStock ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFF00b050),
              "FG Stock", Colors.white),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.fgStock ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFFffc000),
              "Hold Stock", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.holdStock ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, Colors.red, "NG Stock", Colors.white),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.ngStock ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, const Color(0xFF002060), "Total", Colors.white),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.totalStock ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFFe49edd),
              "Today Supply", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.todaySupply ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFF00b0f0),
              "Next Day Supply", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.nextDaySupply ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, Colors.red, "Abnormality", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.abnormality ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFF7030a0),
              "Total Inward Vehicle", Colors.white),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.totalInwardVehicle ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFFb3e5a1),
              "Total Outward Vehicle", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              selectedCustomer.totalOutwardVehicle ?? "-"),
        ],
      ),
    ];
    voidCallBack() async {
      Meta m = await ServiceRepository()
          .getPartListService(customerId: selectedCustomer.customerId ?? "0");
      if (m.statusCode == 200) {
        if (m.response.isNotEmpty) {
          partList.clear();
          for (var v in m.response['result']) {
            partList.add(WarehouseModel.fromJson(v));
          }
          setState(() {});
        }
      }
    }

    voidSpaceCallBack() async {
      Meta m = await ServiceRepository()
          .getSpaceListService(customerId: selectedCustomer.customerId ?? "0");
      if (m.statusCode == 200) {
        if (m.response.isNotEmpty) {
          spaceList = SpaceWiseModel();
          if (m.response['result'] != null && m.response['result'].isNotEmpty) {
            spaceList = SpaceWiseModel.fromJson(m.response['result'][0]);
          }

          setState(() {});
        }
      }
    }

    voidFGAreaCallBack() async {
      fgAreaList.clear();
      Meta m = await ServiceRepository()
          .getFGAreaService(customerId: selectedCustomer.customerId ?? "0");
      if (m.statusCode == 200) {
        if (m.response.isNotEmpty) {
          // log(":::::::::::::::::TTTTTTTTTTTTTTTT\n${jsonEncode(m.response['result'])}");
          List<dynamic> customerSpaceDetails = [];
          List<dynamic> fgStorageLineSpaceDetail = m.response['result'];
          for (var v in m.response['result']) {
            var partDetail = customerSpaceDetails.firstWhere(
                (x) =>
                    x['partSpaceName'] == v['partSpaceName'] &&
                    x['toLineSpaceName'] == v['toLineSpaceName'],
                orElse: () => null);
            if (partDetail == null) {
              customerSpaceDetails.add(v);
              if (!customerSpaceDetails.last.containsKey('spaceDetails')) {
                customerSpaceDetails.last.addAll({'spaceDetails': []});
              }
              customerSpaceDetails.last['spaceDetails'] = jsonDecode(jsonEncode(
                  fgStorageLineSpaceDetail
                      .where((x) =>
                          x['partSpaceName'] == v['partSpaceName'] &&
                          x['toLineSpaceName'] == v['toLineSpaceName'])
                      .toList()));
              int stock = 0;
              List<dynamic> tempVal = [];
              tempVal.addAll(fgStorageLineSpaceDetail.where((x) =>
                  x['partSpaceName'] == v['partSpaceName'] &&
                  x['toLineSpaceName'] == v['toLineSpaceName']));
              for (var v in tempVal) {
                stock = stock + int.parse(v['stock'].toString());
              }
              if (!customerSpaceDetails.last.containsKey('stock')) {
                customerSpaceDetails.last.addAll({'stock': 0});
              }
              customerSpaceDetails.last['stock'] = stock;
            }
          }
          for (var v in customerSpaceDetails) {
            fgAreaList.add(FGAreaModel.fromJson(v));
          }
          // custList.clear();
          // for (var v in m.response['result']) {
          //   custList.add(WarehouseModel.fromJson(v));
          // }
          setState(() {});
        }
      }
    }

    voidBeforeInsAreaCallBack() async {
      Meta m = await ServiceRepository()
          .getBIAreaService(customerId: selectedCustomer.customerId ?? "0");
      if (m.statusCode == 200) {
        if (m.response.isNotEmpty) {
          biAreaList.clear();
          for (var v in m.response['result']) {
            biAreaList.add(BIAreaResult.fromJson(v));
          }
          setState(() {});
        }
      }
      // log(":::::::::::::::::TTTTTTTTTTTTTTTT\n${jsonEncode(biAreaList)}");
    }

    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    await voidCallBack();
                    screenId = 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Customer"),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: sWidth * 0.6,
                  child: Text(
                    selectedCustomer.customerName ?? "-",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sHeight * 0.76,
            width: sWidth,
            child: AutoHeightGridView(
              itemCount: menuData.length,
              controller: scrollController,
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              // mainAxisSpacing: sHeight * 0.02,
              // crossAxisSpacing: sWidth * 0.08,
              builder: (BuildContext context, int index) {
                return menuData[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await voidCallBack();
                    screenId = 3;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.btn2TextColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.whiteColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                  child: const Text("Part wise")),
              ElevatedButton(
                  onPressed: () async {
                    await voidSpaceCallBack();
                    screenId = 4;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.btn2TextColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.whiteColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                  child: const Text("Space wise")),
              ElevatedButton(
                  onPressed: () async {
                    await voidFGAreaCallBack();
                    screenId = 6;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.btn2TextColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused)) {
                          return ColorData.whiteColor;
                        }
                        return Colors.blue;
                      },
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                  child: const Text("FG Area")),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(
          //           onPressed: () {
          //             screenId = 5;
          //             setState(() {});
          //           },
          //           style: ButtonStyle(
          //             overlayColor: WidgetStateProperty.resolveWith<Color?>(
          //               (Set<WidgetState> states) {
          //                 if (states.contains(WidgetState.focused)) {
          //                   return ColorData.btn2TextColor;
          //                 }
          //                 return Colors.blue;
          //               },
          //             ),
          //             foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          //               (Set<WidgetState> states) {
          //                 if (states.contains(WidgetState.focused)) {
          //                   return ColorData.whiteColor;
          //                 }
          //                 return Colors.blue;
          //               },
          //             ),
          //             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(4.0)),
          //             ),
          //           ),
          //           child: const Text("Before Inspection")),
          //       ElevatedButton(
          //           onPressed: () {
          //             screenId = 6;
          //             setState(() {});
          //           },
          //           style: ButtonStyle(
          //             overlayColor: WidgetStateProperty.resolveWith<Color?>(
          //               (Set<WidgetState> states) {
          //                 if (states.contains(WidgetState.focused)) {
          //                   return ColorData.btn2TextColor;
          //                 }
          //                 return Colors.blue;
          //               },
          //             ),
          //             foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          //               (Set<WidgetState> states) {
          //                 if (states.contains(WidgetState.focused)) {
          //                   return ColorData.whiteColor;
          //                 }
          //                 return Colors.blue;
          //               },
          //             ),
          //             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(4.0)),
          //             ),
          //           ),
          //           child: const Text("FG Area")),
          //     ],
          //   ),
          // ),
        ],
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter custWiseSetState) {
        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          screenId = 1;
                          custWiseSetState(() {});
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text("Customer"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(selectedCustomer.customerName ?? ""),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              FocusTraversalOrder(
                order: const NumericFocusOrder(1.0),
                child: Card(
                  elevation: custWiseElevationVal,
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.all(Constants.defaultPadding),
                    width: sWidth,
                    decoration: BoxDecoration(
                      color: custWiseElevationVal > 0
                          ? Constants.primaryColor.withOpacity(0.4)
                          : Constants.secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            custDataTitleCard(cardWidth,
                                const Color(0xFF002060), "Total", Colors.white),
                            custDataTitleCard(cardWidth, Colors.yellow,
                                "Stock IN", Colors.black),
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFF00b050),
                                "FG Stock",
                                Colors.white),
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFFffc000),
                                "Hold Stock",
                                Colors.white),
                            custDataTitleCard(cardWidth, Colors.red, "NG Stock",
                                Colors.white),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.totalStock ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.availableStock ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.fgStock ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.holdStock ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.ngStock ?? "-"),
                          ],
                        ),
                        SizedBox(
                          height: sHeight * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFFe49edd),
                                "Today Supply",
                                Colors.black),
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFF00b0f0),
                                "Next Day Supply",
                                Colors.black),
                            custDataTitleCard(cardWidth, Colors.red,
                                "Abnormality", Colors.white),
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFF7030a0),
                                "Total Inward Vehicle",
                                Colors.white),
                            custDataTitleCard(
                                cardWidth,
                                const Color(0xFFb3e5a1),
                                "Total Outward Vehicle",
                                Colors.black),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.todaySupply ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.nextDaySupply ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.abnormality ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.totalInwardVehicle ?? "-"),
                            custDataCard(cardWidth, cardHeight,
                                selectedCustomer.totalOutwardVehicle ?? "-"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              FocusTraversalOrder(
                  order: const NumericFocusOrder(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            await voidCallBack();
                            screenId = 3;
                            custWiseSetState(() {});
                            setState(() {});
                          },
                          style: ButtonStyle(
                            overlayColor:
                                WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.focused)) {
                                  return ColorData.btn2TextColor;
                                }
                                return Colors.blue;
                              },
                            ),
                            foregroundColor:
                                WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.focused)) {
                                  return ColorData.whiteColor;
                                }
                                return Colors.blue;
                              },
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                          ),
                          child: const Text("Part wise")),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                            onPressed: () async {
                              await voidSpaceCallBack();
                              screenId = 4;
                              custWiseSetState(() {});
                              setState(() {});
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.focused)) {
                                    return ColorData.btn2TextColor;
                                  }
                                  return Colors.blue;
                                },
                              ),
                              foregroundColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.focused)) {
                                    return ColorData.whiteColor;
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
                            child: const Text("Space wise")),
                      ),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       await voidBeforeInsAreaCallBack();
                      //       screenId = 5;
                      //       custWiseSetState(() {});
                      //       setState(() {});
                      //     },
                      //     style: ButtonStyle(
                      //       overlayColor:
                      //           WidgetStateProperty.resolveWith<Color?>(
                      //         (Set<WidgetState> states) {
                      //           if (states.contains(WidgetState.focused)) {
                      //             return ColorData.btn2TextColor;
                      //           }
                      //           return Colors.blue;
                      //         },
                      //       ),
                      //       foregroundColor:
                      //           WidgetStateProperty.resolveWith<Color?>(
                      //         (Set<WidgetState> states) {
                      //           if (states.contains(WidgetState.focused)) {
                      //             return ColorData.whiteColor;
                      //           }
                      //           return Colors.blue;
                      //         },
                      //       ),
                      //       shape:
                      //           WidgetStateProperty.all<RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4.0)),
                      //       ),
                      //     ),
                      //     child: const Text("Before Inspection")),
                      ElevatedButton(
                          onPressed: () async {
                            await voidFGAreaCallBack();
                            screenId = 6;
                            custWiseSetState(() {});
                            setState(() {});
                          },
                          style: ButtonStyle(
                            overlayColor:
                                WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.focused)) {
                                  return ColorData.btn2TextColor;
                                }
                                return Colors.blue;
                              },
                            ),
                            foregroundColor:
                                WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.focused)) {
                                  return ColorData.whiteColor;
                                }
                                return Colors.blue;
                              },
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                          ),
                          child: const Text("FG Area")),
                    ],
                  )),
            ],
          ),
        );
      });
    }
  }

  partWisePage(double sWidth, double sHeight) {
    int partCurrentIndex = -1;
    double partElevationVal = 0.0;
    double cardHeight = sHeight * 0.11;
    if (Responsive.isMobile(context)) {
      String custName = "";
      if (partList.isNotEmpty) {
        custName = partList[0].customerName ?? "-";
        setState(() {});
      }
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    screenId = 2;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Customer"),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(custName),
              ),
            ],
          ),
          SizedBox(
            height: sHeight * 0.8,
            width: sWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custListTitle(sWidth * 0.4, cardHeight, Colors.white,
                          "Part No", Colors.black),
                      custListTitle(sWidth * 0.2, cardHeight, Colors.yellow,
                          "Stock IN", Colors.black),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFF00b050), "FG Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFFffc000), "Hold Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight, Colors.red,
                          "NG Stock", Colors.white),
                      custListTitle(sWidth * 0.2, cardHeight,
                          const Color(0xFF002060), "Total", Colors.white),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFFe49edd),
                          "Today Supply",
                          Colors.black),
                      custListTitle(
                          sWidth * 0.2,
                          cardHeight,
                          const Color(0xFF00b0f0),
                          "Next Day Supply",
                          Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: sHeight * 0.64,
                    width: sWidth * 1.8,
                    child: ListView.builder(
                        itemCount: partList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custListData(
                                  sWidth * 0.4,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  partList[index].partNo ?? "-",
                                  partCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  true),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  partList[index].availableStock ?? "-",
                                  partCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? const Color(0xFF00b050)
                                      : Colors.transparent,
                                  partList[index].fgStock ?? "-",
                                  Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? const Color(0xFFffc000)
                                      : Colors.transparent,
                                  partList[index].holdStock ?? "-",
                                  Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? Colors.red
                                      : Colors.transparent,
                                  partList[index].ngStock ?? "-",
                                  Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? const Color(0xFF002060)
                                      : Colors.transparent,
                                  partList[index].totalStock ?? "-",
                                  Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? const Color(0xFFe49edd)
                                      : Colors.transparent,
                                  partList[index].todaySupply ?? "-",
                                  partCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  false),
                              custListData(
                                  sWidth * 0.2,
                                  cardHeight,
                                  partCurrentIndex == index
                                      ? const Color(0xFF00b0f0)
                                      : Colors.transparent,
                                  partList[index].nextDaySupply ?? "-",
                                  partCurrentIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  false),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter partSetState) {
        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          screenId = 2;
                          partSetState(() {});
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text("Customer"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(partList[0].customerName ?? "-"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custListTitle(sWidth * 0.26, cardHeight, Colors.white,
                      "Part No", Colors.black),
                  custListTitle(sWidth * 0.1, cardHeight, Colors.yellow,
                      "Stock IN", Colors.black),
                  custListTitle(sWidth * 0.1, cardHeight,
                      const Color(0xFF00b050), "FG Stock", Colors.white),
                  custListTitle(sWidth * 0.1, cardHeight,
                      const Color(0xFFffc000), "Hold Stock", Colors.white),
                  custListTitle(sWidth * 0.1, cardHeight, Colors.red,
                      "NG Stock", Colors.white),
                  custListTitle(sWidth * 0.1, cardHeight,
                      const Color(0xFF002060), "Total", Colors.white),
                  custListTitle(sWidth * 0.1, cardHeight,
                      const Color(0xFFe49edd), "Today Supply", Colors.black),
                  custListTitle(sWidth * 0.1, cardHeight,
                      const Color(0xFF00b0f0), "Next Day Supply", Colors.black),
                ],
              ),
              FocusTraversalOrder(
                order: const NumericFocusOrder(0.0),
                child: SizedBox(
                  width: sWidth,
                  height: sHeight * 0.6,
                  child: ListView.builder(
                      itemCount: partList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Focus(
                          autofocus: false,
                          onFocusChange: (value) => {
                            if (value == true)
                              {
                                partCurrentIndex = index,
                                partElevationVal = 8.0,
                              }
                            else
                              {
                                if (partCurrentIndex == 0)
                                  {
                                    partCurrentIndex = -1,
                                  },
                                partElevationVal = 0.0,
                              },
                            partSetState(() {}),
                          },
                          child: Card(
                            elevation: partElevationVal,
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custListData(
                                    sWidth * 0.26,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    partList[index].partNo ?? "-",
                                    partCurrentIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                    true),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? Colors.yellow
                                        : Colors.transparent,
                                    partList[index].availableStock ?? "-",
                                    partCurrentIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? const Color(0xFF00b050)
                                        : Colors.transparent,
                                    partList[index].fgStock ?? "-",
                                    Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? const Color(0xFFffc000)
                                        : Colors.transparent,
                                    partList[index].holdStock ?? "-",
                                    Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? Colors.red
                                        : Colors.transparent,
                                    partList[index].ngStock ?? "-",
                                    Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? const Color(0xFF002060)
                                        : Colors.transparent,
                                    partList[index].totalStock ?? "-",
                                    Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? const Color(0xFFe49edd)
                                        : Colors.transparent,
                                    partList[index].todaySupply ?? "-",
                                    partCurrentIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                    false),
                                custListData(
                                    sWidth * 0.1,
                                    cardHeight,
                                    partCurrentIndex == index
                                        ? const Color(0xFF00b0f0)
                                        : Colors.transparent,
                                    partList[index].nextDaySupply ?? "-",
                                    partCurrentIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                    false),
                              ],
                            ),
                          ),
                          onKeyEvent: (_, event) {
                            return KeyEventResult.ignored;
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  spaceWisePage(double sWidth, double sHeight) {
    double cardHeight = sHeight * 0.18;
    double cardWidth = sWidth * 0.18;
    double cardHeightMobile = sHeight * 0.12;
    double cardWidthMobile = sWidth * 0.3;
    List<Widget> menuData = [
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFF002060),
              "Total Space", Colors.white),
          custDataCard(
              cardWidthMobile, cardHeightMobile, spaceList.totalSpace ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, Colors.yellow, "Used Space", Colors.black),
          custDataCard(
              cardWidthMobile, cardHeightMobile, spaceList.usedSpace ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFF00b050),
              "Free Area", Colors.black),
          custDataCard(
              cardWidthMobile, cardHeightMobile, spaceList.freeArea ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(cardWidthMobile, const Color(0xFFe49edd),
              "Reserved Space", Colors.black),
          custDataCard(cardWidthMobile, cardHeightMobile,
              spaceList.reservedSpace ?? "-"),
        ],
      ),
      Column(
        children: [
          custDataTitleCard(
              cardWidthMobile, Colors.red, "Overflow Area", Colors.white),
          custDataCard(
              cardWidthMobile, cardHeightMobile, spaceList.overflowArea ?? "-"),
        ],
      ),
    ];
    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    screenId = 2;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Customer"),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(spaceList.customerName ?? "-"),
              ),
            ],
          ),
          SizedBox(
            height: sHeight * 0.7,
            width: sWidth,
            child: AutoHeightGridView(
              itemCount: menuData.length,
              controller: scrollController,
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              // mainAxisSpacing: sHeight * 0.02,
              // crossAxisSpacing: sWidth * 0.08,
              builder: (BuildContext context, int index) {
                return menuData[index];
              },
            ),
          ),
        ],
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter spaceSetState) {
        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          screenId = 2;
                          spaceSetState(() {});
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text("Customer"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(spaceList.customerName ?? "-"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custDataTitleCard(cardWidth, const Color(0xFF002060),
                      "Total space", Colors.white),
                  custDataTitleCard(
                      cardWidth, Colors.yellow, "Used space", Colors.black),
                  custDataTitleCard(cardWidth, const Color(0xFF00b050),
                      "Free area", Colors.black),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custDataCard(
                      cardWidth, cardHeight, spaceList.totalSpace ?? "-"),
                  custDataCard(
                      cardWidth, cardHeight, spaceList.usedSpace ?? "-"),
                  custDataCard(
                      cardWidth, cardHeight, spaceList.freeArea ?? "-"),
                ],
              ),
              SizedBox(
                height: sHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custDataTitleCard(cardWidth, const Color(0xFFe49edd),
                      "Reserved Space", Colors.black),
                  custDataTitleCard(
                      cardWidth, Colors.red, "Overflow Area", Colors.white),
                  custDataTitleCardHolder(
                      cardWidth, Colors.red, "Overflow Area", Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custDataCard(
                      cardWidth, cardHeight, spaceList.reservedSpace ?? "-"),
                  custDataCard(
                      cardWidth, cardHeight, spaceList.overflowArea ?? "-"),
                  custDataCardHolder(cardWidth, cardHeight, '0'),
                ],
              ),
              SizedBox(height: Constants.defaultPadding),
            ],
          ),
        );
      });
    }
  }

  custBeforeInspection(double sWidth, double sHeight) {
    int custBIIndex = -1, partFlex = 5, stockFlex = 1, spaceFlex = 3;
    double custElevationVal = 0.0;
    double cardHeight = sHeight * 0.11;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter custBISetState) {
      return FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Column(
          children: [
            FocusTraversalOrder(
              order: const NumericFocusOrder(2.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        screenId = 2;
                        custBISetState(() {});
                        setState(() {});
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text("Before Inspection Area"),
                ],
              ),
            ),
            SizedBox(height: Constants.defaultPadding),
            Row(
              children: [
                Expanded(
                  flex: partFlex,
                  child: custSpaceTitleCard(ColorData.whiteColor, "Part No",
                      ColorData.primaryTextColor, true),
                ),
                Expanded(
                  flex: stockFlex,
                  child: custSpaceTitleCard(
                      Colors.yellow, "Stock", ColorData.primaryTextColor, true),
                ),
                Expanded(
                  flex: spaceFlex,
                  child: custSpaceTitleCard(const Color(0xFF00b050),
                      "Allocation", ColorData.primaryTextColor, true),
                ),
              ],
            ),
            SizedBox(
              width: sWidth,
              height: sHeight * 0.64,
              child: ListView.separated(
                itemCount: biAreaList.length,
                itemBuilder: (BuildContext context, index) {
                  return Focus(
                    autofocus: true,
                    onFocusChange: (value) => {
                      if (value == true)
                        {
                          custBIIndex = index,
                          custElevationVal = 8.0,
                        }
                      else
                        {
                          if (custBIIndex == 0)
                            {
                              custBIIndex = -1,
                            },
                          custElevationVal = 0.0,
                        },
                      custBISetState(() {}),
                    },
                    child: Card(
                      elevation: custElevationVal,
                      margin: EdgeInsets.zero,
                      color: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: partFlex,
                            child: custSpaceTitleCard(
                                custBIIndex == index
                                    ? ColorData.whiteColor
                                    : Colors.transparent,
                                "${biAreaList[index].toLineSpaceName}\n${biAreaList[index].fromLineSpaceName}",
                                custBIIndex == index
                                    ? ColorData.primaryTextColor
                                    : ColorData.whiteColor,
                                false),
                          ),
                          Expanded(
                            flex: stockFlex,
                            child: custSpaceTitleCard(
                                custBIIndex == index
                                    ? Colors.yellow
                                    : Colors.transparent,
                                biAreaList[index].stock.toString(),
                                custBIIndex == index
                                    ? ColorData.primaryTextColor
                                    : ColorData.whiteColor,
                                true),
                          ),
                          Expanded(
                            flex: spaceFlex,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: sWidth * 0.42,
                                  minWidth: sWidth * 0.42,
                                  maxHeight: sHeight * 0.8,
                                  minHeight: cardHeight),
                              child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount:
                                      biAreaList[index].allocatedBins ?? 0,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 2.5,
                                    maxCrossAxisExtent: sWidth * 0.1,
                                    mainAxisExtent: sHeight * 0.12,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white)),
                                      padding: const EdgeInsets.all(10),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onKeyEvent: (_, event) {
                      return KeyEventResult.ignored;
                    },
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(height: sHeight * 0.02);
                },
              ),
            )
            // FocusTraversalOrder(
            //   order: const NumericFocusOrder(1.0),
            //   child: SizedBox(
            //     width: sWidth,
            //     height: sHeight * 0.64,
            //     child: ListView.builder(
            //         itemCount: custList.length,
            //         itemBuilder: (BuildContext context, index) {
            //           return Focus(
            //             autofocus: true,
            //             onFocusChange: (value) => {
            //               if (value == true)
            //                 {
            //                   custCurrentIndex = index,
            //                   custElevationVal = 8.0,
            //                 }
            //               else
            //                 {
            //                   if (custCurrentIndex == 0)
            //                     {
            //                       custCurrentIndex = -1,
            //                     },
            //                   custElevationVal = 0.0,
            //                 },
            //               custFGSetState(() {}),
            //             },
            //             child: ,
            //             onKeyEvent: (_, event) {
            //               return KeyEventResult.ignored;
            //             },
            //           );
            //         }),
            //   ),
            // ),
          ],
        ),
      );
    });
  }

  custFGArea(double sWidth, double sHeight) {
    int custFGIndex = -1, partFlex = 3, stockFlex = 1, spaceFlex = 6;
    double custElevationVal = 0.0;
    double cardHeight = sHeight * 0.11;
    if (Responsive.isMobile(context)) {
      double partWidth = sWidth * 0.44,
          stockWidth = sWidth * 0.26,
          spaceWidth = sWidth * 0.6;
      ScrollController scrollController1 = ScrollController();
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    screenId = 2;
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Good Stock"),
            ],
          ),
          SizedBox(
            height: sHeight * 0.8,
            width: sWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: partWidth,
                        child: custSpaceTitleCard(ColorData.whiteColor,
                            "Part No", ColorData.primaryTextColor, true),
                      ),
                      SizedBox(
                        width: stockWidth,
                        child: custSpaceTitleCard(Colors.yellow, "Stock",
                            ColorData.primaryTextColor, true),
                      ),
                      SizedBox(
                        width: spaceWidth,
                        child: custSpaceTitleCard(const Color(0xFF00b050),
                            "Allocation", ColorData.primaryTextColor, true),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight * 0.64,
                    width: sWidth * 1.3,
                    child: ListView.builder(
                        itemCount: fgAreaList.length,
                        itemBuilder: (BuildContext context, index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController1,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: partWidth,
                                  child: custSpaceTitleCard(
                                      custFGIndex == index
                                          ? ColorData.whiteColor
                                          : Colors.transparent,
                                      fgAreaList[index].toLineSpaceName ?? "",
                                      // "${fgAreaList[index].toLineSpaceName}\n${fgAreaList[index].fromLineSpaceName}",
                                      custFGIndex == index
                                          ? ColorData.primaryTextColor
                                          : ColorData.whiteColor,
                                      false),
                                ),
                                SizedBox(
                                  width: stockWidth,
                                  child: custSpaceTitleCard(
                                      custFGIndex == index
                                          ? Colors.yellow
                                          : Colors.transparent,
                                      fgAreaList[index].stock.toString(),
                                      custFGIndex == index
                                          ? ColorData.primaryTextColor
                                          : ColorData.whiteColor,
                                      true),
                                ),
                                SizedBox(
                                  width: spaceWidth,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: sWidth * 0.42,
                                        minWidth: sWidth * 0.42,
                                        maxHeight: sHeight * 0.8,
                                        minHeight: cardHeight),
                                    child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount:
                                            fgAreaList[index].spaceDetails !=
                                                    null
                                                ? fgAreaList[index]
                                                    .spaceDetails!
                                                    .length
                                                : 0,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0,
                                          childAspectRatio: 1,
                                          maxCrossAxisExtent: sWidth * 0.2,
                                          mainAxisExtent: sHeight * 0.068,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int cIndex) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(2),
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  child: Text(
                                                      "L${fgAreaList[index].spaceDetails![cIndex].fromLineNo}C${fgAreaList[index].spaceDetails![cIndex].fromCol}"),
                                                ),
                                                Text(
                                                    "${fgAreaList[index].spaceDetails![cIndex].usedSpace}",
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter custFGSetState) {
        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          screenId = 2;
                          custFGSetState(() {});
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text("Good Stock"),
                  ],
                ),
              ),
              SizedBox(height: Constants.defaultPadding),
              Row(
                children: [
                  Expanded(
                    flex: partFlex,
                    child: custSpaceTitleCard(ColorData.whiteColor, "Part No",
                        ColorData.primaryTextColor, true),
                  ),
                  Expanded(
                    flex: stockFlex,
                    child: custSpaceTitleCard(Colors.yellow, "Stock",
                        ColorData.primaryTextColor, true),
                  ),
                  Expanded(
                    flex: spaceFlex,
                    child: custSpaceTitleCard(const Color(0xFF00b050),
                        "Allocation", ColorData.primaryTextColor, true),
                  ),
                ],
              ),
              SizedBox(
                width: sWidth,
                height: sHeight * 0.64,
                child: ListView.separated(
                  itemCount: fgAreaList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Focus(
                      autofocus: true,
                      onFocusChange: (value) => {
                        if (value == true)
                          {
                            custFGIndex = index,
                            custElevationVal = 8.0,
                          }
                        else
                          {
                            if (custFGIndex == 0)
                              {
                                custFGIndex = -1,
                              },
                            custElevationVal = 0.0,
                          },
                        custFGSetState(() {}),
                      },
                      child: Card(
                        elevation: custElevationVal,
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: partFlex,
                              child: custSpaceTitleCard(
                                  custFGIndex == index
                                      ? ColorData.whiteColor
                                      : Colors.transparent,
                                  fgAreaList[index].toLineSpaceName ?? "",
                                  // "${fgAreaList[index].toLineSpaceName}\n${fgAreaList[index].fromLineSpaceName}",
                                  custFGIndex == index
                                      ? ColorData.primaryTextColor
                                      : ColorData.whiteColor,
                                  false),
                            ),
                            Expanded(
                              flex: stockFlex,
                              child: custSpaceTitleCard(
                                  custFGIndex == index
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  fgAreaList[index].stock.toString(),
                                  custFGIndex == index
                                      ? ColorData.primaryTextColor
                                      : ColorData.whiteColor,
                                  true),
                            ),
                            Expanded(
                              flex: spaceFlex,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: sWidth * 0.42,
                                    minWidth: sWidth * 0.42,
                                    maxHeight: sHeight * 0.8,
                                    minHeight: cardHeight),
                                child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: fgAreaList[index].spaceDetails !=
                                            null
                                        ? fgAreaList[index].spaceDetails!.length
                                        : 0,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      childAspectRatio: 1,
                                      maxCrossAxisExtent: sWidth * 0.1,
                                      mainAxisExtent: sHeight * 0.1,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int cIndex) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(2),
                                              padding: const EdgeInsets.all(2),
                                              child: Text(
                                                  "L${fgAreaList[index].spaceDetails![cIndex].fromLineNo}C${fgAreaList[index].spaceDetails![cIndex].fromCol}"),
                                            ),
                                            Text(
                                                "${fgAreaList[index].spaceDetails![cIndex].usedSpace}",
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onKeyEvent: (_, event) {
                        return KeyEventResult.ignored;
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, index) {
                    return SizedBox(height: sHeight * 0.02);
                  },
                ),
              )
              // FocusTraversalOrder(
              //   order: const NumericFocusOrder(1.0),
              //   child: SizedBox(
              //     width: sWidth,
              //     height: sHeight * 0.64,
              //     child: ListView.builder(
              //         itemCount: custList.length,
              //         itemBuilder: (BuildContext context, index) {
              //           return Focus(
              //             autofocus: true,
              //             onFocusChange: (value) => {
              //               if (value == true)
              //                 {
              //                   custCurrentIndex = index,
              //                   custElevationVal = 8.0,
              //                 }
              //               else
              //                 {
              //                   if (custCurrentIndex == 0)
              //                     {
              //                       custCurrentIndex = -1,
              //                     },
              //                   custElevationVal = 0.0,
              //                 },
              //               custFGSetState(() {}),
              //             },
              //             child: ,
              //             onKeyEvent: (_, event) {
              //               return KeyEventResult.ignored;
              //             },
              //           );
              //         }),
              //   ),
              // ),
            ],
          ),
        );
      });
    }
  }

  custDataTitleCard(double width, Color bgColor, String value, Color valueBg) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }

  custDataTitleCardHolder(
      double width, Color bgColor, String value, Color valueBg) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          // border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(color: Colors.transparent),
      ),
    );
  }

  custDataCard(double width, double height, String value) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  custDataCardHolder(double width, double height, String value) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: const BoxDecoration(
          // border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.transparent),
      ),
    );
  }

  custListTitle(
      double width, double height, Color bgColor, String value, Color valueBg) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.white),
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }

  custListData(double width, double height, Color bgColor, String value,
      Color valueBg, bool isCustName) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: bgColor, border: Border.all(color: Colors.white)),
      alignment: isCustName ? Alignment.centerLeft : Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }

  custAreaListData(
      double width, double height, Color bgColor, String value, Color valueBg) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: bgColor, border: Border.all(color: Colors.white)),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }

  custAreaAllocationData(
      double width, double height, Color bgColor, String value, Color valueBg) {
    return const ItemCardLayoutGrid(
      crossAxisCount: 2,
      items: [
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
      ],
    );
  }

  custSpaceTitleCard(Color bgColor, String value, Color valueBg, bool isStock) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        // border: Border.all(color: Colors.white),
      ),
      alignment: isStock ? Alignment.center : Alignment.centerLeft,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }

  custSpaceDataCard(
      double width, double height, Color bgColor, String value, Color valueBg) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: valueBg),
      ),
    );
  }
}

class ItemCardLayoutGrid extends StatelessWidget {
  const ItemCardLayoutGrid({
    super.key,
    required this.crossAxisCount,
    required this.items,
  })
  // we only plan to use this with 1 or 2 columns
  : assert(crossAxisCount == 1 || crossAxisCount == 2);
  final int crossAxisCount;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: crossAxisCount == 2
          ? const [auto, auto]
          : const [auto, auto, auto, auto],
      rowGap: 40, // equivalent to mainAxisSpacing
      columnGap: 24, // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      children: [
        // render all the cards with *automatic child placement*
        for (var i = 0; i < items.length; i++)
          Container(
            height: 50,
            width: 50,
            child: Text(items[i]),
          ),
      ],
    );
  }
}
