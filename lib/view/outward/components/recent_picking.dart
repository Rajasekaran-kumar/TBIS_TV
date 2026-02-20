import 'package:flutter/material.dart';
import 'package:tbis_tv/view/outward/components/picking_sublocation.dart';

import '../../../model/outward_model.dart';
import '../../../responsive.dart';
import '../../../utils/constant.dart';

class RecentPicking extends StatelessWidget {
  final List<PickingDetailData> pickingDetailData;
  const RecentPicking({
    super.key,
    required this.pickingDetailData,
  });

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      // margin: const EdgeInsets.only(left: 5, right: 5),
      // padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Constants.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Responsive.isMobile(context)
          ? SizedBox(
              height: sHeight * 0.6,
              width: sWidth,
              child: ListView.separated(
                itemCount: pickingDetailData.length,
                itemBuilder: (BuildContext context, index) {
                  return PickingMobileSubLocation(
                      pickingDetailData: pickingDetailData[index]);
                },
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(height: sHeight * 0.04);
                },
              ),
            )
          : SizedBox(
              width: sWidth,
              height: sHeight * 0.78,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: pickingDetailData.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, index) {
                  return PickingTile(
                    index: index,
                    val: index,
                    pickingDetailData: pickingDetailData[index],
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return const SizedBox(width: 1);
                },
              ),
            ),
    );
  }
}

class PickingTile extends StatefulWidget {
  final Color? color;
  final int index;
  final int val;
  final PickingDetailData pickingDetailData;
  const PickingTile(
      {super.key,
      this.color,
      required this.index,
      required this.val,
      required this.pickingDetailData});

  @override
  State<PickingTile> createState() => _PickingTileState();
}

class _PickingTileState extends State<PickingTile> {
  bool focused = false;
  int index = 0;
  double elevationVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Focus(
        autofocus: true,
        onFocusChange: (value) => setState(() {
          focused = value;
          if (focused) {
            elevationVal = 8.0;
            setState(() {
              index = widget.index;
            });
          } else {
            elevationVal = 0.0;
          }
        }),
        child: Card(
          elevation: elevationVal,
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          child: PickingSubLocation(
            pickingDetailData: widget.pickingDetailData,
          ),
        ),
        onKeyEvent: (_, event) {
          return KeyEventResult.ignored;
        },
      ),
    );
  }
}
