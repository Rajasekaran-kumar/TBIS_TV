import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tbis_tv/utils/constant.dart';
import 'package:tbis_tv/view/controllers/menu_app_controller.dart';
import 'package:tbis_tv/view/customer/bloc/customer_bloc.dart';
import 'package:tbis_tv/view/home/bloc/home_bloc.dart';
import 'package:tbis_tv/view/login/bloc/login_bloc.dart';
import 'package:tbis_tv/view/splash_screen.dart';

import 'flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Injector.configure(Flavor.beta);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<CustomerBloc>(
          create: (BuildContext context) => CustomerBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tbis',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Constants.bgColor,
        textTheme: const TextTheme().apply(bodyColor: Colors.white),
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white),
        canvasColor: Constants.secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!);
      },
      home: const SplashScreen(),
    );
  }
}
