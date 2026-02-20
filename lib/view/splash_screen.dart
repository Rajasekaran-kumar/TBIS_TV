import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/color.dart';
import '../utils/constant.dart';
import 'login/login_page.dart';
import 'home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: FutureBuilder(
        future: getUserDetail(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return AnimatedSplashScreen(
              duration: 2000,
              splash: SvgPicture.asset(
                'assets/images/logo.svg',
                colorFilter: const ColorFilter.mode(
                    ColorData.whiteColor, BlendMode.srcIn),
              ),
              splashIconSize: MediaQuery.of(context).size.width,
              nextScreen: Constants.authToken == ''
                  ? const LoginPage()
                  : const HomePage(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: ColorData.btn2BorderColor);
        },
      ),
    );
  }

  Future<String> getUserDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String authToken = pref.getString('authToken') ?? "";
    String userId = pref.getInt('userId').toString();
    String roleId = pref.getInt('roleId').toString();
    Constants.authToken = authToken;
    Constants.userId = userId;
    Constants.roleId = roleId;
    return authToken;
  }
}
