import 'package:khunlook/themes/appointment/appointment_theme.dart';
import './tooth/tooth_theme.dart';
import 'default_theme.dart';

enum AppTheme { DefualtTheme, AppoimentTheme, ToothTheme }

final appThemeData = {
  AppTheme.DefualtTheme: defaultThemeData,
  AppTheme.AppoimentTheme: appointmentThemeData,
  AppTheme.ToothTheme: toothThemeData,
};
