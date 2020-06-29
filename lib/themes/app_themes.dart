import 'package:khunlook/themes/appointment/appointment_theme.dart';

import 'default_theme.dart';

enum AppTheme {
  DefualtTheme,
  AppoimentTheme,
}

final appThemeData = {
  AppTheme.DefualtTheme: defaultThemeData,
  AppTheme.AppoimentTheme: appointmentThemeData,
};
