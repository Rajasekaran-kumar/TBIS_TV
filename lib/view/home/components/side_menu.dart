// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../utils/constant.dart';
//
// class SideMenu extends StatefulWidget {
//   const SideMenu({super.key});
//
//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             child: SvgPicture.asset(
//               "assets/images/logo.svg",
//               // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
//               fit: BoxFit.none,
//             ),
//           ),
//           DrawerListTile(
//             title: "Dashboard",
//             svgSrc: "assets/icons/menu_dashboard.svg",
//             press: () {
//               Constants.currentMenu = 'dock';
//               Navigator.pop(context);
//               setState(() {});
//             },
//           ),
//           DrawerListTile(
//             title: "Picking",
//             svgSrc: "assets/icons/menu_tran.svg",
//             press: () {
//               Constants.currentMenu = 'picking';
//               Navigator.pop(context);
//               setState(() {});
//             },
//           ),
//           DrawerListTile(
//             title: "Settings",
//             svgSrc: "assets/icons/menu_setting.svg",
//             press: () {},
//           ),
//           ListTile(
//             onTap: () {},
//             horizontalTitleGap: 0.0,
//             leading: const Icon(
//               Icons.logout_outlined,
//               color: Colors.red,
//             ),
//             title: const Text(
//               "Logout",
//               style: TextStyle(color: Colors.red),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile({
//     super.key,
//     // For selecting those three line once press "Command+D"
//     required this.title,
//     required this.svgSrc,
//     required this.press,
//   });
//
//   final String title, svgSrc;
//   final VoidCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: press,
//       horizontalTitleGap: 0.0,
//       leading: SvgPicture.asset(
//         svgSrc,
//         colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
//         height: 16,
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white54),
//       ),
//     );
//   }
// }
