import 'package:flutter/material.dart';

import 'screens/vaccine/vaccine.dart';
import 'themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      title: 'Khunlook',
      initialRoute: 'vaccine',
      routes: {
        'vaccine': (_) => Theme(
              data: appThemeData[AppTheme.VaccineTheme],
              child: VaccineView(),
            ),
      },
    );
  }
}
