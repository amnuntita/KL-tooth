import 'package:flutter/material.dart';
import 'screens/initial_screen.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'themes/app_themes.dart';

const String appTitle = 'Khunlook';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(AppTheme.DefualtTheme),
        ),
      ],
      child: const _Init(),
    );
  }
}

class _Init extends StatelessWidget {
  const _Init();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      title: 'Khunlook',
      initialRoute: '/',
      routes: {
        '/': (_) => InitialScreen(appTitle: appTitle),
      },
    );
  }
}
