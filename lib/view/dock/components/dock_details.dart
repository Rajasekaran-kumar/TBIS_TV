import 'package:flutter/material.dart';
import 'package:tbis_tv/model/dock_model.dart';
import '../../../responsive.dart';
import '../../../utils/constant.dart';
import 'dock_info_card.dart';

class DockDetails extends StatelessWidget {
  final List<DockLoadingStatus> dockLoadingStatus;
  final ScrollController scrollController;
  const DockDetails(
      {super.key,
      required this.dockLoadingStatus,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      height: Responsive.isMobile(context) ? sHeight * 0.42 : sHeight * 0.84,
      padding: EdgeInsets.all(Constants.defaultPadding),
      decoration: BoxDecoration(
        // color: Colors.red,
        color: Constants.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.builder(
        itemCount: dockLoadingStatus.length,
        controller: scrollController,
        itemBuilder: (BuildContext context, index) {
          return DockInfoCard(
            svgSrc: "assets/icons/truck.svg",
            title: dockLoadingStatus[index].dockName ?? "",
            time: dockLoadingStatus[index].startTime ?? "",
            vehicleNo: dockLoadingStatus[index].vehicleNo ?? "",
          );
        },
      ),
    );
  }
}
