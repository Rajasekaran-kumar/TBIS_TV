import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/styles.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with SingleTickerProviderStateMixin {
  late final tickerProvider = createTicker((elapsed) => setState(() {}));

  @override
  void initState() {
    tickerProvider.start();
    super.initState();
  }

  @override
  void dispose() {
    tickerProvider.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd-MMM-yyyy hh:mm:ss').format(DateTime.now()),
      style: Styles.textSemiBoldWithWhite,
    );
  }
}
