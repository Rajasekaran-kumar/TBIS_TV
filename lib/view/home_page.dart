import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/color.dart';
import '../utils/constant.dart';
import '../widgets/cust_appbar.dart';
import 'dashboard/dashboard.dart';
import 'dock/dock.dart';
import 'fifo/fifo.dart';

final CarouselSliderController controller = CarouselSliderController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    Constants.appBarHeight = sHeight * 0.1;
    return FocusScope(
      child: Scaffold(
        backgroundColor: ColorData.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Constants.appBarHeight),
            child: const CustAppbar()),
        body: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              height: sHeight,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
            ),
            items: const [
              DashboardFocus(index: 0, val: 0),
              DockFocus(index: 1, val: 1),
              FifoFocus(index: 2, val: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardFocus extends StatefulWidget {
  final bool? autofocus;
  final int index;
  final int val;
  const DashboardFocus(
      {super.key, this.autofocus, required this.index, required this.val});

  @override
  State<DashboardFocus> createState() => _DashboardFocusState();
}

class _DashboardFocusState extends State<DashboardFocus> {
  bool focused = false;
  int index = 0;
  double elevationVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Focus(
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
      child: const DashboardPage(),
      onKeyEvent: (_, event) {
        if (event.logicalKey == LogicalKeyboardKey.select) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Dashboard PAGE")));
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          controller.nextPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          controller.previousPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
  }
}

class DockFocus extends StatefulWidget {
  final bool? autofocus;
  final int index;
  final int val;
  const DockFocus(
      {super.key, this.autofocus, required this.index, required this.val});

  @override
  State<DockFocus> createState() => _DockFocusState();
}

class _DockFocusState extends State<DockFocus> {
  bool focused = false;
  int index = 0;
  double elevationVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Focus(
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
      child: const DockPage(isHome: true),
      onKeyEvent: (_, event) {
        debugPrint("DOCK EVENT VIEW::::::::::::::");
        if (event.logicalKey == LogicalKeyboardKey.select) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Scaffold(
                  backgroundColor: ColorData.whiteColor,
                  body: DockPage(isHome: false),
                ),
              ));
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          controller.nextPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          controller.previousPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
  }
}

class FifoFocus extends StatefulWidget {
  final bool? autofocus;
  final int index;
  final int val;
  const FifoFocus(
      {super.key, this.autofocus, required this.index, required this.val});

  @override
  State<FifoFocus> createState() => _FifoFocusState();
}

FocusNode fifoChildFocus = FocusNode();

class _FifoFocusState extends State<FifoFocus> {
  bool focused = false;
  int index = 0;
  double elevationVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Focus(
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
      child: const FifoPage(isHome: true),
      onKeyEvent: (_, event) {
        debugPrint("FIFO EVENT VIEW::::::::::::::");
        if (event.logicalKey == LogicalKeyboardKey.select) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Scaffold(
                  backgroundColor: ColorData.whiteColor,
                  body: FifoPage(isHome: false),
                ),
              ));
          debugPrint("Event End");
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          controller.nextPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          controller.previousPage();
          setState(() {});
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
    );
  }
}
