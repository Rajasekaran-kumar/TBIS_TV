import 'package:flutter/material.dart';
import 'package:tbis_tv/utils/constant.dart';

enum Flavor { dev, beta, release }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor? _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  String get baseUrl {
    String url = "";
    switch (_flavor) {
      case Flavor.dev:
        url = Constants.baseUrlDev;
        break;
      case Flavor.beta:
        url = Constants.baseUrlUat;
        break;
      case Flavor.release:
        url = Constants.baseUrlRelease;
        break;
      case null:
        url = Constants.baseUrlDev;
        break;
    }

    debugPrint("Base URL is $url");

    return url;
  }
}
