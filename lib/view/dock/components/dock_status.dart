import 'package:flutter/material.dart';

import '../../../model/dock_model.dart';
import '../../../responsive.dart';
import '../../../theme/color.dart';
import '../../../utils/constant.dart';
import 'dock_status_card.dart';

class DockStatus extends StatelessWidget {
  final List<DockHeadingData> dockHeadingStatus;
  const DockStatus({super.key, required this.dockHeadingStatus});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Responsive(
          mobile: DockStatusGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 2 : 1,
            dockHeadingStatus: dockHeadingStatus,
          ),
          tablet: DockStatusGridView(
            dockHeadingStatus: dockHeadingStatus,
          ),
          desktop: DockStatusGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            dockHeadingStatus: dockHeadingStatus,
          ),
        ),
      ],
    );
  }
}

class DockStatusGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<DockHeadingData> dockHeadingStatus;
  const DockStatusGridView({
    super.key,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1.4,
    required this.dockHeadingStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dockHeadingStatus.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: Constants.defaultPadding,
        mainAxisSpacing: Constants.defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => DockStatusCard(
        info: dockHeadingStatus[index],
        color: index == 0
            ? ColorData.blueColor
            : index == 1
                ? ColorData.blueGreyColor
                : index == 2
                    ? ColorData.orangeColor
                    : index == 3
                        ? ColorData.redColor
                        : index == 4
                            ? ColorData.yellowColor
                            : ColorData.greenColor,
      ),
    );
  }
}
