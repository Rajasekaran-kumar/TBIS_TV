import 'package:flutter/cupertino.dart';

class Constants {
  static const String versionNo = "RC 3.0.0";

  static const String baseUrlDev = "https://tbislive.easyngo.com/tbis/api/";
  // static const String baseUrlDev = "http://192.168.1.4:8282/tbis/api/";
  // static const String baseUrlDev = "http://122.165.75.140/tbis/api/";
  static const String baseUrlUat = "https://tbis-uat.easyngo.com/tbisuat/api/";
  static const String baseUrlRelease = "https://tbislive.easyngo.com/tbis/api/";

  static String userId = "";
  static String authToken = "";
  static int authUserId = 0;
  static String roleId = "";

  static String warehouseId = "";
  static String subLocationId = "";
  static String udcId = "";
  static String warehouseName = "";
  static FocusNode menuFocus = FocusNode();

  static DateTime? lastUpdated;

  static const String notificationKey = 'key';
  static const String notificationTokenExpired = 'TOKEN EXPIRED';

  static double appBarHeight = 0.0;
  static double defaultPadding = 8.0;
  static Color primaryColor = const Color(0xFF2697FF);
  static Color secondaryColor = const Color(0xFF2A2D3E);
  static Color bgColor = const Color(0xFF212332);
}
