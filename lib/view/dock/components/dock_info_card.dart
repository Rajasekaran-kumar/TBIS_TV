import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../responsive.dart';
import '../../../utils/constant.dart';

class DockInfoCard extends StatelessWidget {
  const DockInfoCard({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.time,
    required this.vehicleNo,
  });

  final String title, svgSrc, time, vehicleNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: Constants.primaryColor.withOpacity(0.15)),
      ),
      child: Responsive.isMobile(context)
          ? ListTile(
              // horizontalTitleGap: 2,
              minVerticalPadding: 2,
              // minLeadingWidth: 0,
              minTileHeight: 0,
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  svgSrc,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              title: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                vehicleNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : ListTile(
              // horizontalTitleGap: 2,
              minVerticalPadding: 2,
              // minLeadingWidth: 0,
              minTileHeight: 0,
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  svgSrc,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              title: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                vehicleNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      // child: Row(
      //   children: [
      //     SizedBox(
      //       height: 20,
      //       width: 20,
      //       child: SvgPicture.asset(
      //         svgSrc,
      //         colorFilter:
      //             const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      //       ),
      //     ),
      //     Expanded(
      //       child: Padding(
      //         padding:
      //             EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               title,
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
