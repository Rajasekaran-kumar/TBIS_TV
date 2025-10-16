import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/styles.dart';

class FifoPage extends StatefulWidget {
  final bool isHome;
  const FifoPage({super.key, required this.isHome});

  @override
  State<FifoPage> createState() => _FifoPageState();
}

const List<String> customer = <String>['Daichi', 'JTEKT', 'NTECK', 'Nachi'];
const List<String> usage = <String>['Before Inspection', 'Good Stock'];

class _FifoPageState extends State<FifoPage> {
  String customerValue = customer.first;
  String usageValue = usage.first;

  FocusNode customerFocus = FocusNode();
  FocusNode usageFocus = FocusNode();
  FocusNode searchFocus = FocusNode();

  ScrollController controller = ScrollController();
  FocusNode listFocus = FocusNode();

  int itemCount = 2;

  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double sWidth = MediaQuery.of(context).size.width;
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(2.0),
                    child: SizedBox(
                      width: sWidth * 0.3,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(8)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            value: customerValue,
                            focusNode: customerFocus,
                            padding: EdgeInsets.zero,
                            dropdownColor: ColorData.whiteColor,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: Styles.textSemiBold,
                            onChanged: (String? value) {
                              setState(() {
                                customerValue = value!;
                              });
                              customerFocus.unfocus();
                            },
                            items: customer
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(1.0),
                    child: SizedBox(
                      width: sWidth * 0.3,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(8)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: usageValue,
                            focusNode: usageFocus,
                            isDense: true,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: Styles.textSemiBold,
                            dropdownColor: ColorData.whiteColor,
                            onChanged: (String? value) {
                              setState(() {
                                usageValue = value!;
                              });
                              usageFocus.unfocus();
                            },
                            items: usage
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(3.0),
                    child: ElevatedButton(
                      focusNode: searchFocus,
                      onFocusChange: (val) {
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: searchFocus.hasFocus
                            ? ColorData.redBgColor
                            : ColorData.btn2BorderColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      onPressed: () {
                        debugPrint("FFFFFFFFFFFFFFFFFF");
                      },
                      child: Text(
                        'Search',
                        style: Styles.textSemiBoldWithWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(4),
              color: ColorData.titleBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: sWidth * 0.4,
                    child: Text("Part No", style: Styles.textSemiBold),
                  ),
                  SizedBox(
                    width: sWidth * 0.1,
                    child: Text(
                      "Stock",
                      style: Styles.textSemiBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: sWidth * 0.4,
                    child: Text("Allocation", style: Styles.textSemiBold),
                  ),
                ],
              ),
            ),
            FocusTraversalOrder(
                order: const NumericFocusOrder(4.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    color: ColorData.whiteColor,
                    height: widget.isHome ? sHeight * 0.64 : sHeight * 0.7,
                    width: sWidth,
                    child: KeyboardListener(
                      focusNode: listFocus,
                      onKeyEvent: (value) {
                        if (controller.position.outOfRange) {
                          return;
                        }
                        final offset = controller.offset;
                        if (value.physicalKey.debugName == "Arrow Down") {
                          controller.animateTo(offset + 50,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                        if (value.physicalKey.debugName == "Arrow Up") {
                          controller.animateTo(offset - 50,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      child: ListView.separated(
                        itemCount: 3,
                        // primary: true,
                        controller: controller,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // height: 100,
                                width: sWidth * 0.4,
                                child: Text(
                                  "27521M83M20 3000083-CONE 3000083-CUP 3000241BEARING ASSY, DIFF SIDE HUB ASSY, REAR WHEEL",
                                  style: Styles.textDefault,
                                ),
                              ),
                              SizedBox(
                                // height: 100,
                                width: sWidth * 0.1,
                                // color: Colors.green,
                                child: Text(
                                  "0",
                                  style: Styles.textSemiBold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: sHeight * 0.22,
                                width: sWidth * 0.4,
                                child: GridView.builder(
                                  itemCount: 25,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 10),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 30,
                                      width: 30,
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
