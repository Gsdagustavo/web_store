import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

        /// Provider to keep track of the products
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ],

      /// Entry pointt
      child: const StoreApp(),
    ),
  );
}
