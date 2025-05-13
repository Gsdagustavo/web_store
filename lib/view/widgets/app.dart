import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/themes.dart';
import '../../controller/providers/theme_provider.dart';
import '../pages/home_page.dart';

/// Main application
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Web Store',
          debugShowCheckedModeBanner: false,

          /// Defines the light theme
          theme: lightTheme,

          /// Defines the dark theme
          darkTheme: darkTheme,

          /// Defines whether the theme is dark or light based on the current
          /// state of the theme provider
          themeMode:
              themeProvider.isLightTheme ? ThemeMode.light : ThemeMode.dark,

          /// Routes
          routes: {'/': (context) => const HomePage()},

          /// Defines the home page as the initial route
          initialRoute: '/',
        );
      },
    );
  }
}
