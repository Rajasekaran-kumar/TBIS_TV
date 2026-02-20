import 'package:flutter/material.dart';

import '../../../model/dock_model.dart';
import '../../../responsive.dart';
import '../../../theme/color.dart';
import '../../../utils/constant.dart';

class CustomerWiseStatus extends StatelessWidget {
  final List<DockLoadingDetail> dockLoadingDetail;
  final ScrollController scrollController;
  const CustomerWiseStatus(
      {super.key,
      required this.dockLoadingDetail,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(Constants.defaultPadding),
      decoration: BoxDecoration(
        color: Constants.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Responsive.isMobile(context)
          ? SizedBox(
              height: sHeight * 0.6,
              width: sWidth * 1.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.2,
                            alignment: Alignment.center,
                            child: const Text("TIME"),
                          ),
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.2,
                            alignment: Alignment.center,
                            child: const Text("PROGRESS"),
                          ),
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.48,
                            alignment: Alignment.centerLeft,
                            child: const Text("CUSTOMER"),
                          ),
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.16,
                            alignment: Alignment.center,
                            child: const Text("QUEUE"),
                          ),
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.24,
                            alignment: Alignment.center,
                            child: const Text("DOCK"),
                          ),
                          Container(
                            height: sHeight * 0.04,
                            width: sWidth * 0.24,
                            alignment: Alignment.center,
                            child: const Text("STATUS"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sHeight * 0.5,
                        width: sWidth * 1.52,
                        child: ListView.separated(
                          itemCount: dockLoadingDetail.length,
                          itemBuilder: (BuildContext context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: sWidth * 0.2,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  child: Text(
                                    dockLoadingDetail[index].startTime ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: sWidth * 0.2,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  child: Text(
                                    dockLoadingDetail[index].process ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: sWidth * 0.48,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      dockLoadingDetail[index].customerName ??
                                          ""),
                                ),
                                Container(
                                  width: sWidth * 0.16,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  child: Text(
                                    dockLoadingDetail[index]
                                        .loadingQueue
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: sWidth * 0.24,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  child: Text(
                                    dockLoadingDetail[index].dockNo ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: sWidth * 0.24,
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  alignment: Alignment.center,
                                  child: Text(
                                    dockLoadingDetail[index].status ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, index) {
                            return const Divider(
                                color: Colors.white24, height: 2);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    dataRowMinHeight: 30,
                    dataRowMaxHeight: 30,
                    dataTextStyle: const TextStyle(fontSize: 12),
                    headingTextStyle: const TextStyle(fontSize: 14),
                    headingRowHeight: 30,
                    columnSpacing: 0,
                    // minWidth: 600,
                    columns: const [
                      DataColumn(
                        label: Text("TIME"),
                      ),
                      DataColumn(
                        label: Text("PROCESS"),
                      ),
                      DataColumn(
                        label: Text("CUSTOMER"),
                      ),
                      DataColumn(
                        label: Text("VEHICLE"),
                      ),
                      DataColumn(
                        label: Text("DOCK"),
                      ),
                      DataColumn(
                        label: Text("STATUS"),
                      ),
                    ],
                    rows: List.generate(
                      dockLoadingDetail.length,
                      (index) => recentLoadingDetail(dockLoadingDetail[index]),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

DataRow recentLoadingDetail(DockLoadingDetail dockLoadingDetail) {
  String status = dockLoadingDetail.status ?? '';
  return DataRow(
    cells: [
      DataCell(
        Text(dockLoadingDetail.startTime ?? ""),
      ),
      DataCell(Text(
        dockLoadingDetail.process!,
        style: TextStyle(
            color: dockLoadingDetail.process! == "Outward"
                ? ColorData.blueGreyColor
                : ColorData.orangeColor),
      )),
      DataCell(Text(dockLoadingDetail.customerName ?? "")),
      DataCell(Text(dockLoadingDetail.vehicleNo ?? "")),
      DataCell(Text(dockLoadingDetail.dockNo.toString())),
      DataCell(Text(
        status,
        style: TextStyle(
            color: status.toLowerCase() == "completed"
                ? ColorData.greenColor
                : ColorData.orangeColor),
      )),
    ],
  );
}
