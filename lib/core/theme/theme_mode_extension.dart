import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get name => toString().split('.').last;

  static ThemeMode fromString(String value) {
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }
}
