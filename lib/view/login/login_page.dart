import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbis_tv/responsive.dart';
import 'package:tbis_tv/view/login/bloc/login_bloc.dart';

import '../../model/login_model.dart';
import '../../tbis_core/utils/tbis_utils.dart';
import '../../theme/color.dart';
import '../../theme/styles.dart';
import '../../utils/constant.dart';
import '../../widgets/cust_message.dart';
import '../../widgets/cust_pop_up.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController(text: "mobile");
  TextEditingController pin = TextEditingController(text: "admin@123");

  FocusNode userNameFocus = FocusNode();
  FocusNode pinFocus = FocusNode();
  FocusNode loginFocus = FocusNode();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    userNameFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double sWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) {
            return;
          }
          custCloseAppMessage(context);
        },
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is OnLoginSuccess) {
              setGlobalParameters(state.loginResp);
            }
            if (state is OnFailure) {
              customSnackBar(context, state.error, 2);
            }
          },
          child: Scaffold(
            backgroundColor: ColorData.loginBgColor,
            body: (!Responsive.isMobile(context))
                ? SingleChildScrollView(
                    child: Container(
                      height: sHeight,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/loginbg.png"),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 40),
                      child: Card(
                        elevation: 4.0,
                        margin: pinFocus.hasFocus
                            ? EdgeInsets.only(bottom: sHeight * 0.24)
                            : EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: ColorData.whiteColor,
                        child: Container(
                          width: sWidth * 0.4,
                          padding: EdgeInsets.only(
                            left: 14,
                            top: pinFocus.hasFocus ? 6 : 14,
                            right: 14,
                            bottom: 14,
                          ),
                          child: FocusTraversalGroup(
                            policy: OrderedTraversalPolicy(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/logo.svg",
                                  height: sHeight * 0.06,
                                  width: sWidth * 0.2,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: pinFocus.hasFocus ? 5 : 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: sHeight * 0.08,
                                        width: sWidth * 0.004,
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: ColorData.btnColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "LOGIN",
                                            style: Styles.headerSemiBold,
                                          ),
                                          Text(
                                            "Use your credentials to login your account.",
                                            style: Styles.textDefault,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: pinFocus.hasFocus ? 10 : 20,
                                  ),
                                  child: Text(
                                    "Username",
                                    style: Styles.textDefault,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Constants.defaultPadding,
                                  ),
                                  child: FocusTraversalOrder(
                                    order: const NumericFocusOrder(1.0),
                                    child: TextField(
                                      controller: userName,
                                      style: Styles.textSemiBold,
                                      focusNode: userNameFocus,
                                      autofocus: true,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (val) {
                                        print("::::::::::::: ON SUBMIT");
                                        setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 18,
                                          right: 18,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        fillColor: ColorData.whiteColor,
                                        filled: true,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                      ),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.deny(
                                          '  ',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: pinFocus.hasFocus ? 5 : 10,
                                  ),
                                  child: Text(
                                    "Password",
                                    style: Styles.textDefault,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Constants.defaultPadding,
                                  ),
                                  child: FocusTraversalOrder(
                                    order: const NumericFocusOrder(2.0),
                                    child: TextField(
                                      controller: pin,
                                      style: Styles.textSemiBold,
                                      focusNode: pinFocus,
                                      textInputAction: TextInputAction.done,
                                      scrollPadding: const EdgeInsets.only(
                                        bottom: 50,
                                      ),
                                      onSubmitted: (val) {
                                        loginFocus.requestFocus();
                                        setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 18,
                                          right: 18,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        fillColor: ColorData.whiteColor,
                                        filled: true,
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          borderSide: BorderSide(
                                            color: ColorData.borderColor,
                                          ),
                                        ),
                                      ),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.deny(
                                          '  ',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: FocusTraversalOrder(
                                    order: const NumericFocusOrder(3.0),
                                    child: Focus(
                                      focusNode: loginFocus,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          callLoginService();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: loginFocus.hasFocus
                                              ? ColorData.btn2TextColor
                                              : ColorData.btnColor,
                                          minimumSize: Size(
                                            sWidth * 0.4,
                                            sHeight * 0.07,
                                          ),
                                          maximumSize: Size(
                                            sWidth * 0.4,
                                            sHeight * 0.07,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Login",
                                              style:
                                                  Styles.textSemiBoldWithWhite,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                left: 8,
                                              ),
                                              child: Icon(
                                                Icons.arrow_right_alt,
                                                color: ColorData.whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onKeyEvent: (_, event) {
                                        if (event.logicalKey ==
                                            LogicalKeyboardKey.arrowUp) {
                                          userNameFocus.requestFocus();
                                          setState(() {});
                                          return KeyEventResult.handled;
                                        }
                                        if (event.logicalKey ==
                                            LogicalKeyboardKey.select) {
                                          callLoginService();
                                        }
                                        return KeyEventResult.ignored;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: sHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: sHeight * 0.4,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/login_bg.png",
                              ),
                            ),
                          ),
                          Container(
                            width: sWidth,
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: sHeight * 0.04),
                                Row(
                                  children: [
                                    Container(
                                      height: sHeight * 0.072,
                                      width: sWidth * 0.01,
                                      margin: const EdgeInsets.only(
                                        right: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: ColorData.btnColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "LOGIN",
                                          style: Styles.headerSemiBold,
                                        ),
                                        Text(
                                          "Use your credentials to login your account.",
                                          style: Styles.textDefault,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: sHeight * 0.04),
                                Text("Username", style: Styles.textDefault),
                                TextField(
                                  controller: userName,
                                  style: Styles.textSemiBold,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    fillColor: ColorData.whiteColor,
                                    filled: true,
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.deny('  '),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Password",
                                    style: Styles.textDefault,
                                  ),
                                ),
                                TextField(
                                  controller: pin,
                                  style: Styles.textSemiBold,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    fillColor: ColorData.whiteColor,
                                    filled: true,
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide(
                                        color: ColorData.borderColor,
                                      ),
                                    ),
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.deny('  '),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      callLoginService();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorData.btnColor,
                                      minimumSize: Size(
                                        sWidth,
                                        sHeight * 0.05,
                                      ),
                                      maximumSize: Size(
                                        sWidth,
                                        sHeight * 0.05,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Login",
                                          style: Styles.textSemiBoldWithWhite,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            color: ColorData.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  callLoginService() async {
    loginFocus.unfocus();
    setState(() {});
    if (userName.text.isEmpty || userName.text == " ") {
      customSnackBar(context, "Enter valid username", 2);
      return;
    }
    if (pin.text.isEmpty || pin.text == "") {
      customSnackBar(context, "Enter valid username", 2);
      return;
    }
    bool isNetworkAvailable = await TBISUtils().isInternetConnected();
    if (isNetworkAvailable == false) {
      if (!mounted) return;
      customSnackBar(context, "Please check your Network", 2);
      return;
    }
    Map<String, dynamic> userData = <String, dynamic>{};
    userData['username'] = userName.text.trim();
    userData['password'] = pin.text;
    if (!mounted) return;
    BlocProvider.of<LoginBloc>(
      context,
    ).add(PostLoginEvent(loginData: userData));
  }

  setGlobalParameters(LoginModel loginResp) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('userId', loginResp.userId ?? 0);
    prefs.setString('userName', loginResp.userName ?? "");
    prefs.setInt('roleId', loginResp.roleId ?? 0);
    prefs.setString('authToken', loginResp.token ?? "");
    Constants.userId = loginResp.userId.toString();
    Constants.authToken = loginResp.token ?? "";
    Constants.roleId = loginResp.roleId.toString();
    if (!mounted) return;
    if (Constants.authToken.isNotEmpty) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      customSnackBar(context, "Login Failed", 2);
    }
  }
}
