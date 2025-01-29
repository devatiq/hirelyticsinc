import 'package:flutter/material.dart';

abstract class AppColors {
  static const colorAppGreenDark = Color(0xff021C17);
  static const colorAppBlueDark = Color(0xff010832);
  static const colorAppRed = Color(0xffed1c24);
  static const colorAppGreen = Color(0xff33A88D);
  static const colorAppBlue = Color(0xff049FDA);
  static const colorAppYellow = Color(0xffff875a);
  static const colorAppGrey = Color(0xff686868);
  static const colorAppTransparent = Color(0x00000000);

  static get colorPrimary => colorAppBlue;
  static const colorPrimaryDark = Color(0xff0279a6);
  static const colorPrimaryLight = Color(0xff26bcf6);
  static const colorWhite = Color(0xFFFFFFFF);
  static const colorBlack = Color(0xFF000000);
  static const colorGrey = Color(0xFF7B7B7B);
  static const colorGreyDark = Color(0xFF575757);
  static const colorGrey2 = Color(0xFF9E9E9E);
  static const colorGreyLight = Color(0xFFBBBBBB);
  static const colorGreyExtraLight = Color(0xFFD9D9D9);

  static get colorSecondary => colorAppGreen;

  static const colorFooterBackground = Color(0xFF292829);

  static const colorOnBodyText = Color(0xFF222222);
  static const colorOnTitleText = Color(0xFF777777);
  static const colorOnLabelText = Color(0xFF696969);

  static const colorError = Color(0xffcb0101);
  static const colorBlack2 = Color(0xff021526);

  static const kListBackground = Color(0xFFF6F6F6);
  static const kNavBarBackground = Color(0xffF4F8FF);
  static const kColorGradiant1 = Color(0xFFD7F2FF);
  static const kColorGradiant2 = Color(0xFFABE1FA);
  static const kGradiantHomePage = LinearGradient(
    colors: [kColorGradiant1, kColorGradiant2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const kColorGradiant3 = Color(0xFFEDEDED);
  static const kColorGradiant4 = Color(0xFFF6F6F6);
  static const kGreyGradiant = LinearGradient(
    colors: [kColorGradiant3, kColorGradiant4],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const kGradiantContact = LinearGradient(
    colors: [colorAppBlue, colorAppGreen],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
