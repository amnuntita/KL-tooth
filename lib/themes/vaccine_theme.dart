import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFFF4E1C3);
final Color iconColor = Color(0xFFB98E1E);
final Color accentColor = Color(0xFFDFAE2E);

final vaccineThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,
  accentColor: accentColor,
  appBarTheme: AppBarTheme(color: primaryColor),
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: Color(0xFFF4E1C3),
    textTheme: CupertinoTextThemeData(
      primaryColor: Colors.black,
    ),
  ),
  fontFamily: 'Layiji',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24.0),
    headline2: TextStyle(fontSize: 18.0),
    headline3: TextStyle(fontSize: 16.0),
    headline4: TextStyle(fontSize: 14.0),
    headline5: TextStyle(fontSize: 12.0),
    headline6: TextStyle(fontSize: 10.0),
    bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 18.0),
  ).apply(
    displayColor: Colors.black,
    fontFamily: 'Layiji',
    fontSizeDelta: 2.0,
  ),
  iconTheme: IconThemeData(color: Colors.white),
);
