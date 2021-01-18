import 'package:flutter/material.dart';
import 'package:khunlook/screens/appointment/appointment_screen.dart';
import 'screens/initial_screen.dart';
import 'package:khunlook/screens/tooth/tooth.dart';
import 'package:khunlook/screens/tooth/widgets/info.dart';
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
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: true,
        debugShowMaterialGrid: false,
        theme: theme.currentTheme,
        title: 'Khunlook',
        initialRoute: 'tooth',
        routes: {
          '': (_) => InitialScreen(appTitle: appTitle),
          'appointment': (_) => Theme(
                data: appThemeData[AppTheme.AppoimentTheme],
                child: AppointmentScreen(),
              ),
          'tooth': (_) =>
              Theme(data: appThemeData[AppTheme.ToothTheme], child: Tooth()),
          'info': (_) => Theme(
                data: appThemeData[AppTheme.ToothTheme],
                child: Info(),
              )
        },
      ),
    );
  }
}
