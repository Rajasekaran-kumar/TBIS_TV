import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../responsive.dart';
import '../../../utils/constant.dart';
import '../../../widgets/clock.dart';
import '../../controllers/menu_app_controller.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isMobile(context)) {
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        leading: InkWell(
          focusNode: Constants.menuFocus,
          onTap: context.read<MenuAppController>().controlMenu,
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: SvgPicture.asset("assets/images/logo.svg"),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Constants.warehouseName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const ClockWidget()
          ],
        ),
      );
    } else {
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        leading: InkWell(
          focusNode: Constants.menuFocus,
          onTap: context.read<MenuAppController>().controlMenu,
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: SvgPicture.asset("assets/images/logo.svg"),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
      return Row(
        children: [
          InkWell(
            focusNode: Constants.menuFocus,
            onTap: context.read<MenuAppController>().controlMenu,
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: SvgPicture.asset("assets/images/logo.svg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      );
    }
  }
}

class Header1 extends StatelessWidget {
  const Header1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          InkWell(
            focusNode: Constants.menuFocus,
            onTap: context.read<MenuAppController>().controlMenu,
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: SvgPicture.asset("assets/images/logo.svg"),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            Constants.warehouseName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        if (!Responsive.isMobile(context)) const ClockWidget(),
      ],
    );
  }
}
