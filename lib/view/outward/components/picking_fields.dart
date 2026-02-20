import 'package:flutter/material.dart';
import 'package:tbis_tv/model/outward_model.dart';

import '../../../responsive.dart';
import '../../../theme/color.dart';
import 'picking_info_card.dart';

class PickingFields extends StatelessWidget {
  final List<PickingHeader> pickingHeader;
  const PickingFields({super.key, required this.pickingHeader});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Responsive(
          mobile: PickingInfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 2 : 1,
            pickingHeader: pickingHeader,
          ),
          tablet: PickingInfoCardGridView(pickingHeader: pickingHeader),
          desktop: PickingInfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            pickingHeader: pickingHeader,
          ),
        ),
      ],
    );
  }
}

class PickingInfoCardGridView extends StatelessWidget {
  const PickingInfoCardGridView(
      {super.key,
      this.crossAxisCount = 6,
      this.childAspectRatio = 2.7,
      required this.pickingHeader});

  final int crossAxisCount;
  final double childAspectRatio;
  final List<PickingHeader> pickingHeader;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: pickingHeader.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return PickingInfoCard(
          index: index,
          val: index,
          pickingHeader: pickingHeader[index],
          progressColor: index == 0
              ? ColorData.blueGreyColor
              : index == 1
                  ? ColorData.greenColor
                  : index == 2
                      ? ColorData.yellowColor
                      : ColorData.redColor,
        );
      },
    );
  }
}
