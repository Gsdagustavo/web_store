import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/app_bar.dart';

/// Home page of the app. All the products will be shown in this screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello World!')),
      appBar: MyAppBar(title: 'Home page'),
    );
  }
}
