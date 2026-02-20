import 'package:flutter/material.dart';

import 'color.dart';

class Styles {
  static const double _textSmall = 10;
  static const double _textRegular = 14;
  static const double _textMedium = 16;

  static const double _subHeader = 18;
  static const double _headerDefault = 24;
  static const double _headerMedium = 28;

  static const double _textRegularSmall = 12;
  static const double _textMediumSmall = 14;
  static const double _headerMediumSmall = 26;

  static String latoRegular = 'LatoRegular';
  static String latoSemiBold = 'LatoSemiBold';
  static String latoMedium = 'LatoMedium';

  static final textCell3 = TextStyle(
    fontSize: 14,
    color: ColorData.orangeColor,
    fontFamily: latoSemiBold,
  );
  static final textCell2 = TextStyle(
    fontSize: 14,
    color: ColorData.greenColor,
    fontFamily: latoSemiBold,
  );
  static final textCell1 = TextStyle(
    fontSize: 14,
    color: ColorData.blueGreyColor,
    fontFamily: latoSemiBold,
  );
  static final textCell4 = TextStyle(
    fontSize: 14,
    color: ColorData.redColor,
    fontFamily: latoSemiBold,
  );

  static final textSmallWithWhite = TextStyle(
    fontSize: _textSmall,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  /// Text Styles
  static final textDefault = TextStyle(
    fontSize: _textRegular,
    color: ColorData.primaryTextColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithWhite = TextStyle(
    fontSize: _textRegular,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  static final textDefaultSmall = TextStyle(
    fontSize: _textRegularSmall,
    color: ColorData.primaryTextColor,
    fontFamily: latoRegular,
  );

  static final textSemiBold = TextStyle(
    fontSize: _textMedium,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  static final textSemiBoldSmall = TextStyle(
    fontSize: _textMediumSmall,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  /// Header Styles

  static final headerDefault = TextStyle(
    fontSize: _headerDefault,
    color: ColorData.primaryTextColor,
    fontFamily: latoRegular,
  );
  static final subHeaderDefault = TextStyle(
    fontSize: _subHeader,
    color: ColorData.primaryTextColor,
    fontFamily: latoRegular,
  );
  static final subHeaderDefaultWithYellow = TextStyle(
    fontSize: _subHeader,
    color: ColorData.yellowColor,
    fontFamily: latoRegular,
  );

  static final headerSemiBold = TextStyle(
    fontSize: _headerMedium,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  static final headerSemiBoldSmall = TextStyle(
    fontSize: _headerMediumSmall,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  /// Custom Styles

  static final textSemiBoldWithWhite = TextStyle(
    fontSize: _textMedium,
    color: ColorData.whiteColor,
    fontFamily: latoSemiBold,
  );

  static final headerDefaultWithWhite = TextStyle(
    fontSize: _headerDefault,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );
}
