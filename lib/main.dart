import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_store/controller/providers/theme_provider.dart';
import 'package:web_store/view/pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        /// Provider to keep track of the app's theme state
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Web Store',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
          ),

          themeMode:
              themeProvider.isLightTheme ? ThemeMode.light : ThemeMode.dark,

          routes: {'/': (context) => const HomePage()},

          initialRoute: '/',
        );
      },
    );
  }
}
