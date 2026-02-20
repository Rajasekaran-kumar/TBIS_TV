import 'package:flutter/material.dart';
import '../../model/dock_model.dart';
import '../../responsive.dart';
import '../../utils/constant.dart';
import 'components/header.dart';
import 'components/dock_status.dart';
import 'components/customer_wise_status.dart';
import 'components/dock_details.dart';

class DockPage extends StatelessWidget {
  final DockModel dockResp;
  const DockPage({super.key, required this.dockResp});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        controller: scrollController,
        padding: EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          children: [
            const Header(title: 'Dock Status'),
            SizedBox(height: Constants.defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 1,
                    child: DockDetails(
                        dockLoadingStatus: dockResp.dockLoadingStatus ?? [],
                        scrollController: scrollController),
                  ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: Constants.defaultPadding),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      if (Responsive.isMobile(context))
                        DockStatus(
                            dockHeadingStatus: dockResp.dockHeadingData ?? []),
                      if (Responsive.isMobile(context))
                        SizedBox(height: Constants.defaultPadding),
                      if (Responsive.isMobile(context))
                        DockDetails(
                            scrollController: scrollController,
                            dockLoadingStatus:
                                dockResp.dockLoadingStatus ?? []),
                      if (Responsive.isMobile(context))
                        SizedBox(height: Constants.defaultPadding),
                      if (!Responsive.isMobile(context))
                        DockStatus(
                            dockHeadingStatus: dockResp.dockHeadingData ?? []),
                      SizedBox(height: Constants.defaultPadding),
                      CustomerWiseStatus(
                          dockLoadingDetail: dockResp.dockLoadingDetail ?? [],
                          scrollController: scrollController),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
