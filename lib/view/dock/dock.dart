import 'package:flutter/material.dart';

import '../../theme/styles.dart';

class DockPage extends StatefulWidget {
  final bool isHome;
  const DockPage({super.key, required this.isHome});

  @override
  State<DockPage> createState() => _DockPageState();
}

class _DockPageState extends State<DockPage> {
  FocusNode dropdownFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double sWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Text("DOCK PAGE"),
    );
  }
}
