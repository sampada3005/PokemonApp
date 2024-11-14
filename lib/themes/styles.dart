import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primaryLightColor = Colors.white;
  static Color primaryDarkColor = Colors.black;
}

class Style {
  static ThemeData themeData({bool isDarkTheme = false}) {
    return ThemeData(
      primaryColor: isDarkTheme
          ? AppColors.primaryDarkColor
          : AppColors.primaryLightColor,
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.primaryDarkColor
          : AppColors.primaryLightColor,
      secondaryHeaderColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 67, 63, 63)
          : const Color.fromARGB(255, 175, 170, 170),
      dividerColor: Colors.grey,
      appBarTheme: AppBarTheme(
          backgroundColor: isDarkTheme
              ? AppColors.primaryDarkColor
              : AppColors.primaryLightColor,
          elevation: 0,
          iconTheme:
              IconThemeData(color: isDarkTheme ? Colors.white : Colors.black)),
      textTheme: _textTheme(isDarkTheme),
    );
  }

  static TextTheme _textTheme(bool isDark) {
    return TextTheme(
      headlineSmall: _defaultTextStyle(isDark).copyWith(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: _defaultTextStyle(isDark).copyWith(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: _defaultTextStyle(isDark).copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: _defaultTextStyle(isDark).copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: _defaultTextStyle(isDark).copyWith(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: _defaultTextStyle(isDark).copyWith(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: _defaultTextStyle(isDark).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: _defaultTextStyle(isDark).copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: _defaultTextStyle(isDark).copyWith(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: _defaultTextStyle(isDark).copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: _defaultTextStyle(isDark).copyWith(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: _defaultTextStyle(isDark).copyWith(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: _defaultTextStyle(isDark).copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: _defaultTextStyle(isDark).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: _defaultTextStyle(isDark).copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle _defaultTextStyle(bool isDark) => GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: isDark ? Colors.white : Colors.black);
}
