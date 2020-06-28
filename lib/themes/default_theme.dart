import 'package:flutter/material.dart';

final defaultThemeData = ThemeData(
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
    fontFamily: 'Layiji',
    fontSizeDelta: 2.0,
  ),
);
