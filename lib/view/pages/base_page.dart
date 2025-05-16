import 'package:flutter/material.dart';
import 'package:web_store/view/widgets/app_bar.dart';
import 'package:web_store/view/widgets/bottom_navigator.dart';

/// This is a Base Page that can be reused in most of the application's pages
class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.body,
    required this.title,
    required this.useNavigator,
  });

  /// The body of the scaffold
  final Widget body;

  /// The title that will be shown in the AppBar
  final String title;

  /// Whether the page will have the [MyBottomNavigatorBar] or not
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
