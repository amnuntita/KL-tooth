import 'default_theme.dart';
import 'vaccine_theme.dart';

enum AppTheme {
  DefualtTheme,
  VaccineTheme,
}

final appThemeData = {
  AppTheme.DefualtTheme: defaultThemeData,
  AppTheme.VaccineTheme: vaccineThemeData,
};
