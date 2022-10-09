import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // only 1 instance of this class

  // LIGHT MODE COLORS
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Colors.white60;
  static const Color _lightOnPrimaryColor = Colors.black87;
  static const Color _lightTextColorPrimary = Colors.black87;
  static const Color _appbarColorLight = Color(0xff01C13B);
  static const Color _accentColorLight = Color(0xff01C13B);

  // DARK MODE COLORS
  static final Color _darkPrimaryColor = Colors.grey.shade900;
  static final Color _darkPrimaryVariantColor = Colors.grey.shade800;
  static const Color _darkOnPrimaryColor = Colors.white;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.grey.shade900;
  static const Color _accentColorDark = Color(0xff01C13B);

  static const Color _iconColor = Colors.white;

  // LIGHT TEXT STYLES
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 20);

  static const TextStyle _lightHeading2 = TextStyle(
      color: _lightTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16);

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle _lightBodyText2 = TextStyle(
    color: _lightTextColorPrimary,
    fontSize: 18,
  );

  // DARK TEXT STYLES
  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkHeading2 =
      _lightHeading2.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkBodyText =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkBodyText2 =
      _lightBodyText2.copyWith(color: _darkTextColorPrimary);

  // TEXT THEMES
  static const TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingText,
      headline2: _lightHeading2,
      bodyText1: _lightBodyText,
      bodyText2: _lightBodyText2);

  static final TextTheme _darkTextTheme = TextTheme(
      headline1: _darkHeadingText,
      headline2: _darkHeading2,
      bodyText1: _darkBodyText,
      bodyText2: _darkBodyText2);

  // THEME DATA
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      bottomAppBarColor: _appbarColorLight,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor),
          toolbarTextStyle: TextStyle(color: _lightPrimaryColor),
          titleTextStyle: TextStyle(
              color: _lightPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20)),
      colorScheme: const ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          secondary: _accentColorLight),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      bottomAppBarColor: _appbarColorDark,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: Color(0xff01C13B)),
          toolbarTextStyle: const TextStyle(color: _lightPrimaryColor),
          titleTextStyle: const TextStyle(
              color: _lightPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20)),
      colorScheme: ColorScheme.dark(
          primary: _darkPrimaryColor,
          onPrimary: _darkOnPrimaryColor,
          secondary: _accentColorDark),
      textTheme: _darkTextTheme);
}
