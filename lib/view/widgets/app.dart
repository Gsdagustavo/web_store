import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/login_provider.dart';
import 'package:web_store/core/keys/navigator_key.dart';
import 'package:web_store/view/pages/cart_page.dart';
import 'package:web_store/view/pages/login_page.dart';
import 'package:web_store/view/pages/product_details_page.dart';
import 'package:web_store/view/pages/profile_page.dart';
import 'package:web_store/view/pages/settings_page.dart';

import '../../controller/providers/theme_provider.dart';
import '../../core/constants/themes.dart';
import '../../model/product_model.dart';
import '../pages/home_page.dart';

/// Main application
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LoginProvider>(
      builder: (context, themeProvider, loginProvider, child) {
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

          navigatorKey: navigatorKey,

          /// Routes
          routes: {
            '/': (context) => SplashScreen(),
            '/homePage': (context) => const HomePage(),
            '/loginPage': (context) => const LoginPage(),
            '/cartPage': (context) => const CartPage(),
            '/profilePage': (context) => const ProfilePage(),
            '/settingsPage': (context) => const SettingsPage(),
            '/productDetails': (context) {
              final arguments =
                  ModalRoute.of(context)!.settings.arguments as Product;
              return ProductDetailsPage(product: arguments);
            },
          },

          /// Start with splash screen that will handle auth
          initialRoute: '/',
        );
      },
    );
  }
}

/// A splash screen that checks authentication status before
/// navigating to the appropriate screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    await loginProvider.loadUser();

    /// If the user is logged in, pushes the Home Page
    ///
    /// Otherwise, pushes the Login Page
    if (loginProvider.isLoggedIn) {
      Navigator.of(context).pushReplacementNamed('/homePage');
    } else {
      Navigator.of(context).pushReplacementNamed('/loginPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Web Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
