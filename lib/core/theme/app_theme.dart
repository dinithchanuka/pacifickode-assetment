import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: LightColors().background,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Manrope',
    useMaterial3: true,
    scaffoldBackgroundColor: DarkColors().background,
  );

  static ThemeColors getColors(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkColors()
        : LightColors();
  }
}
