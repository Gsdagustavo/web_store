import 'package:flutter/material.dart';
import 'package:web_store/view/pages/home_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Store',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.deepPurple),

      routes: {'/': (context) => const HomePage()},

      initialRoute: '/',
    );
  }
}
