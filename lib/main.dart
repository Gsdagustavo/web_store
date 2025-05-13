import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/theme_provider.dart';
import 'package:web_store/view/pages/home_page.dart';

import 'constants/themes.dart';

/// Entry point of the application
void main() {
  runApp(
    /// Providers
    MultiProvider(
      providers: [
        /// Provider to keep track of the app's theme state
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],

      /// Entry pointt
      child: const StoreApp(),
    ),
  );
}

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
