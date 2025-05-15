import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/view/pages/login_page.dart';
import 'package:web_store/view/pages/product_details_page.dart';

import '../../constants/themes.dart';
import '../../controller/providers/theme_provider.dart';
import '../../model/product_model.dart';
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
          routes: {
            '/homePage': (context) => const HomePage(),
            '/loginPage': (context) => const LoginPage(),
            '/productDetails': (context) {
              final arguments =
                  ModalRoute.of(context)!.settings.arguments as Product;
              return ProductDetailsPage(product: arguments);
            },
          },

          /// Defines the login page as the initial route
          initialRoute: '/loginPage',
        );
      },
    );
  }
}
