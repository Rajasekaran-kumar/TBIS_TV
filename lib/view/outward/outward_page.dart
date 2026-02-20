import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tbis_tv/view/outward/components/picking_fields.dart';
import 'package:tbis_tv/view/outward/components/recent_picking.dart';
import '../../model/outward_model.dart';
import '../../responsive.dart';
import '../../theme/styles.dart';
import '../../utils/constant.dart';
import '../dock/components/header.dart';

class OutwardPage extends StatelessWidget {
  final OutwardModel outwardResp;

  const OutwardPage({super.key, required this.outwardResp});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            const Header(title: 'Outward Status'),
            // SizedBox(height: Constants.defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  SizedBox(width: Constants.defaultPadding),
                Expanded(
                  flex: 1,
                  child: FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: Column(
                      children: [
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(2.0),
                          child: PickingFields(
                              pickingHeader: outwardResp.pickingHeader ?? []),
                        ),
                        if (Responsive.isMobile(context))
                          SizedBox(height: Constants.defaultPadding),
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(1.0),
                          child: RecentPicking(
                              pickingDetailData:
                                  outwardResp.pickingDetailData ?? []),
                        ),
                        if (Responsive.isMobile(context))
                          Padding(
                            padding:
                                EdgeInsets.only(top: Constants.defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Total",
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
                          ),
                      ],
                    ),
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
