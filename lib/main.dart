import 'package:flutter/material.dart';

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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Hello World!')));
  }
}
