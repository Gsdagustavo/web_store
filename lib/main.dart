import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/cart_provider.dart';
import 'package:web_store/controller/providers/login_provider.dart';
import 'package:web_store/controller/providers/products_provider.dart';
import 'package:web_store/controller/providers/theme_provider.dart';
import 'package:web_store/view/widgets/app.dart';

/// Entry point of the application
void main() {
  runApp(
    /// Providers
    MultiProvider(
      providers: [
        /// Provider to keep track of the app's theme state
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        /// Provider to keep track of the login state
        ChangeNotifierProvider(create: (context) => LoginProvider()),

        /// Provider to keep track of the products state
        ChangeNotifierProvider(create: (context) => ProductsProvider()),

        /// Provider to keep track of the cart state
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],

      /// Entry point
      child: const StoreApp(),
    ),
  );
}
