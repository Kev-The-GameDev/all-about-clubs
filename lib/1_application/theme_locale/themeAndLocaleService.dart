import 'package:aac/injection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeAndLocaleService extends ChangeNotifier {
  bool darkModeOn = false;

  void toggleTheme() {
    darkModeOn = !darkModeOn;
    serviceLocator<SharedPreferences>().setBool('darkMode', darkModeOn);
    notifyListeners();
  }

  void setDarkMode(bool on) {
    darkModeOn = on;

    serviceLocator<SharedPreferences>().setBool('darkMode', darkModeOn);

    notifyListeners();
  }

  Locale currentLocale = const Locale('en');
  void setLocale(String newLocale) {
    currentLocale = Locale(newLocale);

    serviceLocator<SharedPreferences>().setString('locale', newLocale);

    notifyListeners();
  }

  setLoadedData(String locale, bool darkMode) {
    currentLocale = Locale(locale);
    darkModeOn = darkMode;
  }
}
