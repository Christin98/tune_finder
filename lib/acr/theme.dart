import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color white = Colors.white;

const Color black = Colors.black;

const Color kPrimaryColor = Color(0xffEE2261);

const Color bgColor = Color(0xff2F2F2F);

themeData(context) => ThemeData(
      primaryColor: kPrimaryColor,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

overrideDeviceColors() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    /* set Status bar color in Android devices. */
    statusBarColor: Colors.transparent,
    /* set Status bar icons color in Android devices.*/
    statusBarIconBrightness: Brightness.light,
    /* set Status bar icon color in iOS. */
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: bgColor,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
