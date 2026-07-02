import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: Colors.white,

    primaryColor: AppColors.primary,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    fontFamily: "Poppins",
  );
}
