import 'dart:ui';

class AppColors {
  static const Color backgroundLight = Color(0xFFF7FCF7);
  static const Color backgroundDark = Color(0xFF0F2410);
}

class ThemeColors {
  final Color background;

  ThemeColors({required this.background});
}

class LightColors extends ThemeColors {
  LightColors() : super(background: AppColors.backgroundLight);
}

class DarkColors extends ThemeColors {
  DarkColors() : super(background: AppColors.backgroundDark);
}
