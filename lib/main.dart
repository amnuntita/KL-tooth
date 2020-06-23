import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'screens/vaccine/vaccine.dart';
import 'themes/app_themes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(appThemeData[AppTheme.VaccineTheme]),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      theme: theme.currentTheme,
      title: 'Khunlook',
      initialRoute: 'vaccine',
      routes: {
        'vaccine': (_) => VaccineView(),
      },
    );
  }
}
