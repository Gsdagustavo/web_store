import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/app_bar.dart';
import 'package:web_store/view/widgets/bottom_navigator.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.body,
    required this.title,
    required this.useNavigator,
  });

  final Widget body;
  final String title;
  final bool useNavigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigatorBar(),
      appBar: MyAppBar(title: title),
      body: body,
    );
  }
}
