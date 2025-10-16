import 'package:flutter/material.dart';

import 'color.dart';

class Styles {
  static const double _textRegular = 14;
  static const double _textMedium = 16;
  static const double _textSizeEighteen = 18;
  static const double _textSizeTwenty = 20;

  static const double _headerDefault = 24;
  static const double _headerMedium = 28;

  static const double _textRegularSmall = 12;
  static const double _textMediumSmall = 14;
  static const double _textSizeEighteenSmall = 16;
  // static const double _textSizeTwentySmall = 18;

  static const double _headerDefaultSmall = 22;
  static const double _headerMediumSmall = 26;

  static String latoRegular = 'LatoRegular';
  static String latoSemiBold = 'LatoSemiBold';
  static String latoMedium = 'LatoMedium';

  /// Custom Styles

  static final textDefaultWithWhite = TextStyle(
    fontSize: _textRegular,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithWhiteSmall = TextStyle(
    fontSize: _textRegularSmall,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithSixteen = TextStyle(
    fontSize: _textMedium,
    color: ColorData.primaryTextColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithBlue = TextStyle(
    fontSize: _textRegular,
    color: ColorData.textBtnColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithBtnRed = TextStyle(
    fontSize: _textRegular,
    color: ColorData.btnColor,
    fontFamily: latoRegular,
  );

  static final textDefaultWithBtnRedSmall = TextStyle(
    fontSize: _textRegularSmall,
    color: ColorData.btnColor,
    fontFamily: latoRegular,
  );

  static final labelTextWithEighteen = TextStyle(
    fontSize: _textSizeEighteen,
    color: ColorData.labelTextColor,
    fontFamily: latoRegular,
  );

  static final labelTextEighteenPrimary = TextStyle(
    fontSize: _textSizeEighteen,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  static final labelTextEighteenPrimarySmall = TextStyle(
    fontSize: _textSizeEighteenSmall,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  static final textSemiBoldWithBlue = TextStyle(
    fontSize: _textMedium,
    color: ColorData.textBtnColor,
    fontFamily: latoSemiBold,
  );

  static final textSemiBoldWithWhite = TextStyle(
    fontSize: _textMedium,
    color: ColorData.whiteColor,
    fontFamily: latoSemiBold,
  );

  static final textSemiBoldWithWhiteSmall = TextStyle(
    fontSize: _textMediumSmall,
    color: ColorData.whiteColor,
    fontFamily: latoSemiBold,
  );

  static final headerSemiBoldWithWhite = TextStyle(
    fontSize: _headerDefault,
    color: ColorData.whiteColor,
    fontFamily: latoSemiBold,
  );

  static final headerSemiBoldWithWhiteSmall = TextStyle(
    fontSize: _headerDefault,
    color: ColorData.whiteColor,
    fontFamily: latoSemiBold,
  );

  static final headerDefaultWithWhite = TextStyle(
    fontSize: _headerDefault,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  static final headerDefaultWithWhiteSmall = TextStyle(
    fontSize: _headerDefaultSmall,
    color: ColorData.whiteColor,
    fontFamily: latoRegular,
  );

  static final textSemiBoldWithTwenty = TextStyle(
    fontSize: _textSizeTwenty,
    color: ColorData.primaryTextColor,
    fontFamily: latoSemiBold,
  );

  static final textAssign = TextStyle(
    fontSize: _textRegular,
    color: ColorData.assignTextColor,
    fontFamily: latoRegular,
  );
  static final textRequest = TextStyle(
    fontSize: _textRegular,
    color: ColorData.requestTextColor,
    fontFamily: latoRegular,
  );
  static final textPicked = TextStyle(
    fontSize: _textRegular,
    color: ColorData.pickedTextColor,
    fontFamily: latoRegular,
  );
  static final textDeliver = TextStyle(
    fontSize: _textRegular,
    color: ColorData.deliveredTextColor,
    fontFamily: latoRegular,
  );

  /// Text Styles
  static final textDefault = TextStyle(
    fontSize: _textRegular,
    color: ColorData.primaryTextColor,
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
}
