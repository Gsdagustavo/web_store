import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String appThemeKey = 'theme';

abstract class IThemeProvider {
  Future loadTheme();
  Future toggleTheme();
}

class ThemeProvider with ChangeNotifier implements IThemeProvider {
  bool isLoading = false;

  bool isLightTheme = false;

  @override
  Future loadTheme() async {
    isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    isLightTheme = prefs.getBool(appThemeKey) ?? false;

    isLoading = false;
    notifyListeners();
  }

  @override
  Future toggleTheme() {
    // TODO: implement toggleTheme
    throw UnimplementedError();
  }
}
