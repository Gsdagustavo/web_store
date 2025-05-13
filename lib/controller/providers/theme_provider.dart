import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IThemeProvider {
  Future loadTheme();

  Future toggleTheme();
}

/// Provider that implements [IThemeProvider]
///
/// This provider serves to keep track of the current theme of the application
class ThemeProvider with ChangeNotifier implements IThemeProvider {
  bool isLoading = false;

  ///  Dark theme is the default
  bool isLightTheme = false;

  ThemeProvider() {
    _init();
  }

  void _init() async {
    await loadTheme();
  }

  /// Loads the theme from Shared Preferences
  @override
  Future<void> loadTheme() async {
    isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      isLightTheme = prefs.getBool(appThemeKey) ?? false;
    } catch (e) {
      throw Exception(e);
    }

    isLoading = false;
    notifyListeners();
  }

  /// Toggles the current theme
  @override
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isLightTheme = !isLightTheme;
    prefs.setBool(appThemeKey, isLightTheme);
    notifyListeners();
  }
}
