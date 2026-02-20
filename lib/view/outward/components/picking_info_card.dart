import 'package:flutter/material.dart';
import '../../../model/outward_model.dart';
import '../../../utils/constant.dart';

// class PickingInfoCard extends StatelessWidget {
//   const PickingInfoCard(
//       {super.key, required this.info, required this.focusNode});
//
//   final FocusNode focusNode;
//   final CloudStorageInfo info;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(Constants.defaultPadding),
//       decoration: BoxDecoration(
//         color: Constants.secondaryColor,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             info.title!,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           ProgressLine(
//             color: info.color,
//             percentage: info.percentage,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "${info.numOfFiles} Files",
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodySmall!
//                     .copyWith(color: Colors.white70),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class PickingInfoCard extends StatefulWidget {
  final PickingHeader pickingHeader;
  final bool? autofocus;
  final int index;
  final int val;
  final Color progressColor;
  const PickingInfoCard(
      {super.key,
      required this.pickingHeader,
      this.autofocus,
      required this.index,
      required this.val,
      required this.progressColor});

  @override
  State<PickingInfoCard> createState() => _PickingInfoCardState();
}

class _PickingInfoCardState extends State<PickingInfoCard> {
  bool focused = false;
  int index = 0;
  double elevationVal = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Focus(
        autofocus: widget.autofocus ?? true,
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
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: elevationVal > 0
                  ? Constants.primaryColor.withOpacity(0.4)
                  : Constants.secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pickingHeader.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ProgressLine(
                  color: widget.progressColor,
                  percentage: widget.pickingHeader.percent!.round(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pickingHeader.value.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white70),
                    ),
                    Text(
                      "${widget.pickingHeader.percent} %",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onKeyEvent: (_, event) {
          // if (event.logicalKey == LogicalKeyboardKey.select) {
          //   ScaffoldMessenger.of(context).clearSnackBars();
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text(
          //           "Button ${widget.index + 1} is pressed with OnKeyEvent")));
          //   return KeyEventResult.handled;
          // }
          // if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          //   Constants.menuFocus.requestFocus();
          //   ScaffoldMessenger.of(context).clearSnackBars();
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //       content: Text("Up arrow is pressed with OnKeyEvent")));
          //   return KeyEventResult.handled;
          // }
          return KeyEventResult.ignored;
        },
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  static const Color pColor = Color(0xFF2697FF);
  const ProgressLine({
    super.key,
    this.color = pColor,
    required this.percentage,
  });

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
