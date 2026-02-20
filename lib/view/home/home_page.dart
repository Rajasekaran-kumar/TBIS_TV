import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tbis_tv/model/outward_model.dart';
import 'package:tbis_tv/view/home/bloc/home_bloc.dart';
import 'package:tbis_tv/view/outward/outward_page.dart';

import '../../model/customer_model.dart';
import '../../model/dock_model.dart';
import '../../model/login_location_model.dart';
import '../../model/warehouse_model.dart';
import '../../responsive.dart';
import '../../theme/color.dart';
import '../../utils/constant.dart';
import '../../widgets/cust_message.dart';
import '../../widgets/cust_pop_up.dart';
import '../controllers/menu_app_controller.dart';
import '../customer/customer_page.dart';
import '../dock/dock_page.dart';
import '../fifo/fifo_page.dart';
import '../login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool load = false;

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    Constants.lastUpdated = DateTime.now();
    BlocProvider.of<HomeBloc>(context).add(const GetLoginLocationEvent());
    refreshService();
    super.initState();
  }

  refreshService() {
    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      BlocProvider.of<HomeBloc>(context)
          .add(GetDockEvent(warehouseId: Constants.warehouseId));
      BlocProvider.of<HomeBloc>(context)
          .add(GetOutwardEvent(warehouseId: Constants.warehouseId));
      BlocProvider.of<HomeBloc>(context)
          .add(GetWarehouseEvent(warehouseId: Constants.warehouseId));
      Constants.lastUpdated = DateTime.now();
      setState(() {});
      debugPrint("List Refreshed Successfully");
    });
  }

  OutwardModel outwardResp = OutwardModel();
  DockModel dockResp = DockModel();
  List<PickingHeader> pickingHeader = [];
  WarehouseModel warehouseResp = WarehouseModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is OnLoginLocationSuccess) {
          List<LocationModel> locationModel = [];
          if (state.locationModel.isNotEmpty) {
            locationModel = state.locationModel;
            Constants.warehouseId = locationModel.first.warehouseId ?? "";
            Constants.warehouseName = locationModel.first.warehouseName ?? "";
            Constants.subLocationId = locationModel.first.subLocationId ?? "";
            if (Constants.warehouseId.isNotEmpty) {
              BlocProvider.of<HomeBloc>(context)
                  .add(GetDockEvent(warehouseId: Constants.warehouseId));
              BlocProvider.of<HomeBloc>(context)
                  .add(GetOutwardEvent(warehouseId: Constants.warehouseId));
              BlocProvider.of<HomeBloc>(context)
                  .add(GetWarehouseEvent(warehouseId: Constants.warehouseId));
            } else {
              setState(() {
                load = true;
              });
              customSnackBar(context, "Warehouse ID is empty", 2);
            }
          } else {
            setState(() {
              load = true;
            });
            customSnackBar(context, "Login Location is empty", 2);
          }
        }

        if (state is OnDockSuccess) {
          dockResp = state.dockResp;
          setState(() {});
        }

        if (state is OnWarehouseSuccess) {
          warehouseResp = state.warehouseResp;
          setState(() {});
        }

        if (state is OnOutwardSuccess) {
          outwardResp = state.outwardResp;
          setState(() {
            load = true;
          });
        }

        if (state is OnFailure) {
          setState(() {
            load = true;
          });
          customSnackBar(context, state.error, 2);
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) {
            return;
          }
          custCloseAppMessage(context);
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: load
              ? Scaffold(
                  key: context.read<MenuAppController>().scaffoldKey,
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        DrawerHeader(
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",
                            fit: BoxFit.none,
                          ),
                        ),
                        Container(
                          color: selectedIndex == 0
                              ? ColorData.greenColor
                              : Colors.transparent,
                          child: ListTile(
                            autofocus: selectedIndex == 0 ? true : false,
                            onTap: () {
                              _onItemTapped(0);
                              Navigator.pop(context);
                            },
                            selected: selectedIndex == 0,
                            horizontalTitleGap: 0.0,
                            leading: Image.asset(
                              "assets/icons/supply.png",
                              height: 16,
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                            title: Text(
                              "Outward",
                              style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ),
                        Container(
                          color: selectedIndex == 1
                              ? ColorData.greenColor
                              : Colors.transparent,
                          child: ListTile(
                            autofocus: selectedIndex == 1 ? true : false,
                            onTap: () {
                              _onItemTapped(1);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            selected: selectedIndex == 1,
                            horizontalTitleGap: 0.0,
                            leading: Image.asset(
                              "assets/icons/dock.png",
                              height: 16,
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                            title: Text(
                              "Dock Status",
                              style: TextStyle(
                                  color: selectedIndex == 1
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ),
                        Container(
                          color: selectedIndex == 2
                              ? ColorData.greenColor
                              : Colors.transparent,
                          child: ListTile(
                            autofocus: selectedIndex == 2 ? true : false,
                            onTap: () {
                              _onItemTapped(2);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            selected: selectedIndex == 2,
                            horizontalTitleGap: 0.0,
                            leading: Image.asset(
                              "assets/icons/dock.png",
                              height: 16,
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                            title: Text(
                              "Customer Status",
                              style: TextStyle(
                                  color: selectedIndex == 2
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Constants.authToken = "";
                            Constants.userId = '';
                            Constants.roleId = '';
                            Constants.warehouseId = "";
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginPage()));
                            });
                          },
                          selected: selectedIndex == 3,
                          horizontalTitleGap: 0.0,
                          leading: const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                  body: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: Drawer(
                              child: ListView(
                                children: [
                                  DrawerHeader(
                                    child: SvgPicture.asset(
                                      "assets/images/logo.svg",
                                      // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  Container(
                                    color: selectedIndex == 0
                                        ? ColorData.greenColor
                                        : Colors.transparent,
                                    child: ListTile(
                                      autofocus:
                                          selectedIndex == 0 ? true : false,
                                      onTap: () {
                                        _onItemTapped(0);
                                        Navigator.pop(context);
                                      },
                                      selected: selectedIndex == 0,
                                      horizontalTitleGap: 0.0,
                                      leading: Image.asset(
                                        "assets/icons/supply.png",
                                        height: 16,
                                        color: selectedIndex == 0
                                            ? Colors.white
                                            : Colors.white54,
                                      ),
                                      title: Text(
                                        "Outward",
                                        style: TextStyle(
                                            color: selectedIndex == 0
                                                ? Colors.white
                                                : Colors.white54),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: selectedIndex == 1
                                        ? ColorData.greenColor
                                        : Colors.transparent,
                                    child: ListTile(
                                      autofocus:
                                          selectedIndex == 1 ? true : false,
                                      onTap: () {
                                        _onItemTapped(1);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      selected: selectedIndex == 1,
                                      horizontalTitleGap: 0.0,
                                      leading: Image.asset(
                                        "assets/icons/dock.png",
                                        height: 16,
                                        color: selectedIndex == 1
                                            ? Colors.white
                                            : Colors.white54,
                                      ),
                                      title: Text(
                                        "Dock Status",
                                        style: TextStyle(
                                            color: selectedIndex == 1
                                                ? Colors.white
                                                : Colors.white54),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: selectedIndex == 2
                                        ? ColorData.greenColor
                                        : Colors.transparent,
                                    child: ListTile(
                                      autofocus:
                                          selectedIndex == 2 ? true : false,
                                      onTap: () {
                                        _onItemTapped(2);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      selected: selectedIndex == 2,
                                      horizontalTitleGap: 0.0,
                                      leading: Image.asset(
                                        "assets/icons/dock.png",
                                        height: 16,
                                        color: selectedIndex == 2
                                            ? Colors.white
                                            : Colors.white54,
                                      ),
                                      title: Text(
                                        "Customer Status",
                                        style: TextStyle(
                                            color: selectedIndex == 2
                                                ? Colors.white
                                                : Colors.white54),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Constants.authToken = "";
                                      Constants.userId = '';
                                      Constants.roleId = '';
                                      Constants.warehouseId = "";
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const LoginPage()));
                                      });
                                    },
                                    selected: selectedIndex == 3,
                                    horizontalTitleGap: 0.0,
                                    leading: const Icon(
                                      Icons.logout_outlined,
                                      color: Colors.red,
                                    ),
                                    title: const Text(
                                      "Logout",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        Expanded(
                          flex: 5,
                          child: selectedIndex == 0
                              ? OutwardPage(outwardResp: outwardResp)
                              : selectedIndex == 1
                                  ? DockPage(dockResp: dockResp)
                                  : selectedIndex == 2
                                      ? CustomerPage(
                                          custDashData: warehouseResp)
                                      : const FifoPage(),
                        ),
                      ],
                    ),
                  ),
                )
              : const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
