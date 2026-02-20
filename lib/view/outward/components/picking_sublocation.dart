import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tbis_tv/view/outward/components/picking_cell.dart';

import '../../../model/outward_model.dart';
import '../../../responsive.dart';
import '../../../theme/styles.dart';
import '../../../utils/constant.dart';

class PickingSubLocation extends StatelessWidget {
  final PickingDetailData pickingDetailData;

  const PickingSubLocation({super.key, required this.pickingDetailData});

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: sWidth * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pickingDetailData.subLocationName ?? "",
                style: Styles.subHeaderDefaultWithYellow,
              ),
              Row(
                children: [
                  Text(
                    "TOTAL",
                    style: Styles.textCell3,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "COMPLETED",
                    style: Styles.textCell2,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "PROGRESS",
                    style: Styles.textCell1,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "DELAYED",
                    style: Styles.textCell4,
                  ),
                ],
              ),
              if (!Responsive.isMobile(context))
                Text(
                    "Last updated at ${DateFormat("HH:mm:ss").format(Constants.lastUpdated ?? DateTime.now())}",
                    style: Styles.textSmallWithWhite),
            ],
          ),
        ),
        SizedBox(
          height: sHeight * 0.72,
          width: sWidth * 0.98,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pickingDetailData.pickingSlots?.length ?? 0,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: sHeight * 0.003,
              ),
              itemBuilder: (context, index) {
                return listCellData(index);
              }),
        ),
      ],
    );
  }

  bool checkRange() {
    final startTime = DateTime(2018, 6, 23, 10, 30);
    final endTime = DateTime(2018, 6, 23, 13, 00);

    final currentTime = DateTime.now();

    if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
      return true;
    }
    return false;
  }

  listCellData(int index) {
    // bool checkRange = false;
    // String tempTitle = pickingDetailData.pickingSlots![index].timeTile ?? "0";
    // String tempTodayDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // String tempStartDate = "$tempTodayDate $tempTitle:00";
    // DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(tempStartDate);
    // final startTime = tempDate;
    // final endTime = DateTime(2024, 12, 06, 11, 05);
    //
    // final currentTime = DateTime.now();
    //
    // if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
    //   checkRange = true;
    // }
    // print("$startTime - $endTime - $checkRange");
    return PickingCell(
      title: pickingDetailData.pickingSlots![index].timeTile ?? "",
      total: pickingDetailData.pickingSlots![index].total.toString(),
      completed: pickingDetailData.pickingSlots![index].completed.toString(),
      progress: pickingDetailData.pickingSlots![index].progress.toString(),
      delay: pickingDetailData.pickingSlots![index].delay.toString(),
    );
  }

  bool isValidTimeRange(TimeOfDay startTime) {
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour > startTime.hour) ||
        (now.hour == startTime.hour && now.minute >= startTime.minute));
  }
}

class PickingMobileSubLocation extends StatelessWidget {
  final PickingDetailData pickingDetailData;

  const PickingMobileSubLocation({super.key, required this.pickingDetailData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pickingDetailData.subLocationName ?? "",
          style: Styles.subHeaderDefaultWithYellow,
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: pickingDetailData.pickingSlots?.length ?? 0,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) {
              return PickingCell(
                title: pickingDetailData.pickingSlots?[index].timeTile ?? "",
                total: pickingDetailData.pickingSlots![index].total.toString(),
                completed:
                    pickingDetailData.pickingSlots![index].pending.toString(),
                progress:
                    pickingDetailData.pickingSlots![index].progress.toString(),
                delay: pickingDetailData.pickingSlots![index].delay.toString(),
              );
            }),
      ],
    );
  }
}
